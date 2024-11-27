//
//  NetworkResult.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case failure(String)
    case decodedError
    case serverError
    case networkFail
    
    var stateDescription: String {
        switch self {
        case .success(let data):
            return "🎉성공!"
        case .failure(let message):
            return "🚨\(message)"
        case .decodedError:
            return "🚨데이터 디코딩에 실패하였습니다."
        case .serverError:
            return "🚨서버의 내부적인 오류입니다."
        case .networkFail:
            return "🚨네트워크 오류가 발생하였습니다."
        }
    }
}
