//
//  TimeSwiftUIViewModel.swift
//  CGV
//
//  Created by 최안용 on 11/25/24.
//

import SwiftUI

final class TimeSwiftUIViewModel: ObservableObject {
    @Published var moviePosters: [MoviePoster] = MoviePoster.mockData()
    @Published var dateInfo = DateInfo.mockData()
    @Published var theaterInfo: [TheaterInfo] = []
    @Published var theaterTimeTables: [TheaterTimeTable] = []
    
    private let theaterService: TheaterService
    
    var theaterChangeButtonAction: () -> Void
    var closeButtonAction: () -> Void
    var timeTableCellButtonAction: () -> Void
    
    init(theaterService: TheaterService,
         theaterChangeButtonAction: @escaping () -> Void,
         closeButtonAction: @escaping () -> Void,
         timeTableCellButtonAction: @escaping () -> Void
    ) {
        self.theaterService = theaterService
        self.theaterChangeButtonAction = theaterChangeButtonAction
        self.closeButtonAction = closeButtonAction
        self.timeTableCellButtonAction = timeTableCellButtonAction
    }
    
    func fetchTheaterInfo() {
        let dispatchGroup = DispatchGroup()

        theaterInfo.forEach { theater in
            var theaterTimeTable = TheaterTimeTable(
                theaterName: theater.theaterName,
                movieTimeTables: []
            )

            theater.auditoriumType.forEach { (auditorium, auditoriumType) in
                dispatchGroup.enter()
                theaterService.fetchMovieTime(
                    theaterID: theater.theaterId,
                    auditorium: auditorium,
                    auditoriumType: auditoriumType,
                    request: EmptyModel()
                ) { response in
                    switch response {
                    case .success(let result):
                        var timeTable = MovieTimeTable(
                            auditorium: auditorium,
                            auditoriumType: auditoriumType,
                            movieId: 0,
                            movieName: "",
                            theaterId: theater.theaterId,
                            timeInfos: []
                        )
                        
                        result.data.movieList.forEach { times in
                            let timeInfo = TimeInfo(
                                startTime: times.startTime.toTime(),
                                endTime: times.endTime.toTime(),
                                isMorning: times.isMorning,
                                totalSeat: "185",
                                remainingSeats: String(Range(0...185).randomElement()!)
                            )
                            timeTable.timeInfos.append(timeInfo)
                        }
                                                
                        theaterTimeTable.movieTimeTables.append(timeTable)
                    case .failure, .decodedError, .serverError, .networkFail:
                        print(response.stateDescription)
                    }
                    dispatchGroup.leave()
                }
            }

            dispatchGroup.notify(queue: .main) {
                self.theaterTimeTables.append(theaterTimeTable)
            }
        }
    }

}
