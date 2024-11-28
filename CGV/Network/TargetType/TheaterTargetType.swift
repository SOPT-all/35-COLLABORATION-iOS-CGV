//
//  TheaterTargetType.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation
import Moya

enum TheaterTargetType {
    case fetchMovieTime(theaterID: Int, auditorium: String, auditoriumType: String)
    case fetchMovieTheater
}

extension TheaterTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchMovieTime(let theaterID, _, _):
            return "/theater/\(theaterID)/movie"
        case .fetchMovieTheater: 
            return "/theater"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchMovieTheater: 
            return .requestPlain
        case .fetchMovieTime(_, let auditorium, let auditoriumType):
            return .requestParameters(
                parameters: ["auditorium": auditorium, "auditoriumType": auditoriumType],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
