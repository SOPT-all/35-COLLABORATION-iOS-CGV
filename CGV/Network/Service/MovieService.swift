//
//  MovieService.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation
import Moya

protocol MovieServiceProtocol {
    typealias MovieDetailResponseModel = BaseResponseBody<MovieDetailResponse>
    func fetchMovieDetail(
        movieID: Int,
        request: EmptyModel,
        completion: @escaping(NetworkResult<MovieDetailResponseModel>) -> Void
    )
}

final class MovieService: MovieServiceProtocol {
    let provider: MoyaProvider<MovieTargetType>
    
    init(provider: MoyaProvider<MovieTargetType> = MoyaProvider(plugins: [MoyaLoggingPlugin()])) {
        self.provider = provider
    }
    
    func fetchMovieDetail(
        movieID: Int,
        request: EmptyModel,
        completion: @escaping (NetworkResult<MovieDetailResponseModel>) -> Void
    ) {
        provider.request(.fetchMovieDetail(movieID: movieID)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, MovieDetailResponseModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    public func judgeStatus<T: Codable>(
        by statusCode: Int,
        _ data: Data,
        _ object: T.Type
    ) -> NetworkResult<T> {
        
        switch statusCode {
        case 200..<205:
            return decodeSuccessResponse(data: data, T.self)
        case 400..<500:
            return decodeErrorResponse(data)
        case 500:
            return .serverError
        default:
            return .networkFail
        }
    }
    
    private func decodeSuccessResponse<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<T> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            return .decodedError
        }
        
        return .success(decodedData)
    }
    
    private func decodeErrorResponse<T: Codable>(_ data: Data) -> NetworkResult<T> {
        let decoder = JSONDecoder()
        guard let errorResponse = try? decoder.decode(ErrorResponseBody.self, from: data) else {
            return .decodedError
        }
        
        return .failure(errorResponse.message)
    }
}
