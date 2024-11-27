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
    @Published var theaterTimeTables: [TheaterTimeTable] = TheaterTimeTable.makeMockData()
    
    var theaterChangeButtonAction: () -> Void
    var closeButtonAction: () -> Void
    
    init(theaterChangeButtonAction: @escaping () -> Void,
         closeButtonAction: @escaping () -> Void
    ) {
        self.theaterChangeButtonAction = theaterChangeButtonAction
        self.closeButtonAction = closeButtonAction
    }
}
