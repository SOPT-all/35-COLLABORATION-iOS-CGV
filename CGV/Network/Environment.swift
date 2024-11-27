//
//  Environment.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation

enum Environment {
    static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
