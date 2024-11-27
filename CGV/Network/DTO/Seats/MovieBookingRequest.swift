//
//  MovieBookingRequest.swift
//  CGV
//
//  Created by 예삐 on 11/27/24.
//

import Foundation

struct MovieBookingRequest: RequestModelType {
    let movieName, theaterName, startTime, endTime: String
    let ticketCount: Int
}
