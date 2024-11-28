//
//  ErrorResponseBody.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation

struct ErrorResponseBody: Codable {
    let status: Int
    let message: String
}
