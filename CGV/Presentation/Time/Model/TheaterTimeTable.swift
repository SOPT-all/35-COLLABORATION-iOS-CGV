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
    let movieTimeTables: [MovieTimeTable]
}

struct MovieTimeTable: Identifiable {
    let id = UUID()
    let auditorium: String
    let auditoriumType: String
    let movieId: Int
    let movieName: String
    let theaterId: Int
    let timeInfos: [TimeInfo]
}

struct TimeInfo: Identifiable {
    let id = UUID()
    let startTime: String
    let endTime: String
    let isMorning: Bool
    let totalSeat: String
    let remainingSeats: String
}

extension TheaterTimeTable {
    static func makeMockData() -> [TheaterTimeTable] {
        [
            .init(theaterName: "용산아이파크몰",
                  movieTimeTables: [
                    .init(
                        auditorium: "7관",
                        auditoriumType: "2D",
                        movieId: 1,
                        movieName: "음",
                        theaterId: 1,
                        timeInfos: [
                            .init(
                                startTime: "07:50",
                                endTime: "09:41",
                                isMorning: true,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                            .init(
                                startTime: "10:50",
                                endTime: "12:41",
                                isMorning: false,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                            .init(
                                startTime: "13:50",
                                endTime: "15:41",
                                isMorning: true,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                            .init(
                                startTime: "16:50",
                                endTime: "17:41",
                                isMorning: false,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                            .init(
                                startTime: "18:50",
                                endTime: "19:41",
                                isMorning: true,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                            .init(
                                startTime: "20:50",
                                endTime: "21:41",
                                isMorning: false,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                        ]
                    ),
                    .init(
                        auditorium: "IMAX LASER 2D",
                        auditoriumType: "2D",
                        movieId: 1,
                        movieName: "음",
                        theaterId: 1,
                        timeInfos: [
                            .init(
                                startTime: "07:50",
                                endTime: "09:41",
                                isMorning: false,
                                totalSeat: "185",
                                remainingSeats: "184"
                            )
                        ]
                    ),
                    .init(
                        auditorium: "7관",
                        auditoriumType: "IMAX LASER 2D",
                        movieId: 1,
                        movieName: "음",
                        theaterId: 1,
                        timeInfos: [
                            .init(
                                startTime: "07:50",
                                endTime: "09:41",
                                isMorning: true,
                                totalSeat: "185",
                                remainingSeats: "184"
                            )
                        ]
                    ),
                    .init(
                        auditorium: "7관",
                        auditoriumType: "2D",
                        movieId: 1,
                        movieName: "음",
                        theaterId: 1,
                        timeInfos: [
                            .init(
                                startTime: "07:50",
                                endTime: "09:41",
                                isMorning: false,
                                totalSeat: "185",
                                remainingSeats: "184"
                            )
                        ]
                    ),
                    .init(
                        auditorium: "7관",
                        auditoriumType: "2D",
                        movieId: 1,
                        movieName: "음",
                        theaterId: 1,
                        timeInfos: [
                            .init(
                                startTime: "07:50",
                                endTime: "09:41",
                                isMorning: true,
                                totalSeat: "185",
                                remainingSeats: "184"
                            )
                        ]
                    )
                  ]
                 ),
            .init(theaterName: "구리",
                  movieTimeTables: [
                    .init(
                        auditorium: "7관",
                        auditoriumType: "2D",
                        movieId: 1,
                        movieName: "음",
                        theaterId: 1,
                        timeInfos: [
                            .init(
                                startTime: "07:50",
                                endTime: "09:41",
                                isMorning: true,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                            .init(
                                startTime: "10:50",
                                endTime: "12:41",
                                isMorning: false,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                            .init(
                                startTime: "13:50",
                                endTime: "15:41",
                                isMorning: true,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                            .init(
                                startTime: "16:50",
                                endTime: "17:41",
                                isMorning: false,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                            .init(
                                startTime: "18:50",
                                endTime: "19:41",
                                isMorning: true,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                            .init(
                                startTime: "20:50",
                                endTime: "21:41",
                                isMorning: false,
                                totalSeat: "185",
                                remainingSeats: "184"
                            ),
                        ]
                    ),
                    .init(
                        auditorium: "7관",
                        auditoriumType: "IMAX LASER 2D",
                        movieId: 1,
                        movieName: "음",
                        theaterId: 1,
                        timeInfos: [
                            .init(
                                startTime: "07:50",
                                endTime: "09:41",
                                isMorning: false,
                                totalSeat: "185",
                                remainingSeats: "184"
                            )
                        ]
                    ),
                    .init(
                        auditorium: "7관",
                        auditoriumType: "2D",
                        movieId: 1,
                        movieName: "음",
                        theaterId: 1,
                        timeInfos: [
                            .init(
                                startTime: "07:50",
                                endTime: "09:41",
                                isMorning: true,
                                totalSeat: "185",
                                remainingSeats: "184"
                            )
                        ]
                    ),
                    .init(
                        auditorium: "7관",
                        auditoriumType: "2D",
                        movieId: 1,
                        movieName: "음",
                        theaterId: 1,
                        timeInfos: [
                            .init(
                                startTime: "07:50",
                                endTime: "09:41",
                                isMorning: false,
                                totalSeat: "185",
                                remainingSeats: "184"
                            )
                        ]
                    ),
                    .init(
                        auditorium: "7관",
                        auditoriumType: "2D",
                        movieId: 1,
                        movieName: "음",
                        theaterId: 1,
                        timeInfos: [
                            .init(
                                startTime: "07:50",
                                endTime: "09:41",
                                isMorning: true,
                                totalSeat: "185",
                                remainingSeats: "184"
                            )
                        ]
                    )
                  ]
                 )
        ]
    }
}
