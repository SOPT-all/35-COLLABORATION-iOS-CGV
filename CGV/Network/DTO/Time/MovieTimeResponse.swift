//
//  MovieTimeResponse.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation

struct MovieTimeResponse: ResponseModelType {
    let movieList: [MovieList]
}

struct MovieList: Codable {
    let auditorium: String
    let auditoriumType: String
    let movieID: Int
    let startTime: String
    let endTime: String
    let isMorning: Bool
    let movieName: String
    let ticket: [String]
    let seatiOS: String
    let seatAnd: String
    
    enum CodingKeys: String, CodingKey {
        case auditorium, auditoriumType
        case movieID = "id"
        case startTime, endTime
        case isMorning = "morning"
        case movieName
        case ticket, seatiOS, seatAnd
    }
}
