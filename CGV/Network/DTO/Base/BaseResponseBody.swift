//
//  BaseResponseBody.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation

struct BaseResponseBody<T: ResponseModelType>: Codable {
    let status: Int
    let message: String
    let data: [T?]
}

struct TestResponseBody<T: ResponseModelType>: Codable {
    let status: Int
    let message: String
    let data: T
}
