//
//  RegionInfo.swift
//  CGV
//
//  Created by 최안용 on 11/19/24.
//

import Foundation

struct RegionInfo {
    let region: RegionType
    var theaters: [TheaterInfo] = []
}

extension RegionInfo {
    static func initTheaters() -> [Self] {
        return RegionType.allCases.map { region in
            if region == .suggestion {
                RegionInfo(
                    region: region,
                    theaters: [
                        .init(theaterName: "구리", theaterId: 1),
                        .init(theaterName: "압구정", theaterId: 2),
                        .init(theaterName: "용산아이파크몰", theaterId: 3)
                    ]
                )
            } else {
                RegionInfo(region: region)
            }
        }
    }
}
