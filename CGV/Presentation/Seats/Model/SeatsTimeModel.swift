//
//  SeatsTimeModel.swift
//  CGV
//
//  Created by 예삐 on 11/21/24.
//

import UIKit

struct SeatsTimeModel {
    let startTime: String
    let endTime: String
    let isMorning: Bool
}

extension SeatsTimeModel {
    static func mockTimeData() -> [SeatsTimeModel] {
        return [
            SeatsTimeModel(startTime: "07:50", endTime: "~09:41", isMorning: true),
            SeatsTimeModel(startTime: "07:50", endTime: "~09:41", isMorning: false),
            SeatsTimeModel(startTime: "07:50", endTime: "~09:41", isMorning: false),
            SeatsTimeModel(startTime: "07:50", endTime: "~09:41", isMorning: false),
            SeatsTimeModel(startTime: "07:50", endTime: "~09:41", isMorning: false)
        ]
    }
}
