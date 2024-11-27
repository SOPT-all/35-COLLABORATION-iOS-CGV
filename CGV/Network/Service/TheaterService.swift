//
//  TheaterService.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation
import Moya

protocol TheaterServiceProtocol {
    typealias MovieTimeResponseModel = BaseResponseBody<MovieTimeResponse>
    func fetchMovieTime(
        theaterID: Int,
        request: EmptyModel,
        completion: @escaping(NetworkResult<MovieTimeResponseModel>) -> Void
    )
    
    typealias MovieTheaterResponseModel = BaseResponseBody<MovieTheaterResponse>
    func fetchMovieTheater(
        request: EmptyModel,
        completion: @escaping(NetworkResult<MovieTheaterResponseModel>) -> Void
    )
}

final class TheaterService: TheaterServiceProtocol {
    let provider: MoyaProvider<TheaterTargetType>
    
    init(provider: MoyaProvider<TheaterTargetType> = MoyaProvider(plugins: [MoyaLoggingPlugin()])) {
        self.provider = provider
    }
    
    func fetchMovieTime(
        theaterID: Int,
        request: EmptyModel,
        completion: @escaping (NetworkResult<MovieTimeResponseModel>) -> Void
    ) {
        provider.request(.fetchMovieTime(theaterID: theaterID)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, MovieTimeResponseModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func fetchMovieTheater(
        request: EmptyModel,
        completion: @escaping (NetworkResult<MovieTheaterResponseModel>) -> Void
    ) {
        provider.request(.fetchMovieTheater) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, MovieTheaterResponseModel.self)
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
