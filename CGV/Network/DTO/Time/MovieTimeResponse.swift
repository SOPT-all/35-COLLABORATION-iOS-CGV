//
//  MovieTimeResponse.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation

struct MovieTimeResponse: ResponseModelType {
    let auditorium, auditoriumType: String
    let movieID: Int
    let startTime, endTime: String
    let isMorning: Bool
    let movieName: String
    let theaterID: Int
    
    enum CodingKeys: String, CodingKey {
        case auditorium, auditoriumType
        case movieID = "movieId"
        case startTime, endTime, isMorning, movieName
        case theaterID = "theaterId"
    }
}
