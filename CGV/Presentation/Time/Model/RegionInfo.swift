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
            RegionInfo(region: region)
        }
    }
}
