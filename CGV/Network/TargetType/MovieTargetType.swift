//
//  MovieTargetType.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation
import Moya

enum MovieTargetType {
    case fetchMovieDetail(movieID: Int)
    case bookingMovie(userID: Int, request: MovieBookingRequest)
}

extension MovieTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchMovieDetail(let movieID): 
            return "/movie/\(movieID)"
        case .bookingMovie(let userID, _):
            return "/movie/booking/\(userID)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchMovieDetail: 
            return .get
        case .bookingMovie: 
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchMovieDetail: 
            return .requestPlain
        case .bookingMovie(let request, _):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
