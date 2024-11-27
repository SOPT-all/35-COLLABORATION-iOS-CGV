//
//  MoviePoster.swift
//  CGV
//
//  Created by 최안용 on 11/23/24.
//

import SwiftUI

struct MoviePoster: Identifiable {
    let id = UUID()
    let image: Image
}

extension MoviePoster {
    static func mockData() -> [MoviePoster] {
        return [
            .init(image: .init(.imgTimePoster1Selected)),
            .init(image: .init(.imgTimePoster2Disabled)),
            .init(image: .init(.imgTimePoster3Disabled)),
            .init(image: .init(.imgTimePoster4Disabled)),
            .init(image: .init(.imgTimePoster5Disabled))
        ]
    }
}
