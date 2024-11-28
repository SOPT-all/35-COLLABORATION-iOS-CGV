//
//  MovieDetailResponse.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation

struct MovieDetailResponse: ResponseModelType {
    let movieID: Int
    let movieName, auditoriumType, theaterName, startTime: String
    let endTime, releaseDate: String
    let isMorning: Bool
    let seatiOS, seatAnd: String
    
    enum CodingKeys: String, CodingKey {
        case movieID = "movieId"
        case movieName, auditoriumType, theaterName, startTime, endTime, releaseDate, isMorning, seatiOS, seatAnd
    }
}
