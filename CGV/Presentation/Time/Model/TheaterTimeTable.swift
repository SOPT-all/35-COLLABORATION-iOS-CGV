//
//  TheaterTimeTable.swift
//  CGV
//
//  Created by 최안용 on 11/26/24.
//

import Foundation

struct TheaterTimeTable: Identifiable {
    let id = UUID()
    let theaterName: String
    var movieTimeTables: [MovieTimeTable]
}

struct MovieTimeTable: Identifiable {
    let id = UUID()
    let auditorium: String
    let auditoriumType: String
    var movieId: Int
    var movieName: String
    let theaterId: Int
    var timeInfos: [TimeInfo]
}

struct TimeInfo: Identifiable {
    let id = UUID()
    let startTime: String
    let endTime: String
    let isMorning: Bool
    let totalSeat: String
    let remainingSeats: String
}
