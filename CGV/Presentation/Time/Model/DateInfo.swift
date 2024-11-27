//
//  DateInfo.swift
//  CGV
//
//  Created by 최안용 on 11/23/24.
//

import Foundation

struct DateInfo: Hashable {
    let dateNum: String
    let dateString: String
}

extension DateInfo {
    static func mockData() -> [DateInfo] {
        return [
            .init(dateNum: "5", dateString: "오늘"),
            .init(dateNum: "6", dateString: "내일"),
            .init(dateNum: "7", dateString: "수"),
            .init(dateNum: "8", dateString: "목"),
            .init(dateNum: "9", dateString: "금"),
            .init(dateNum: "10", dateString: "토"),
            .init(dateNum: "11", dateString: "일")
        ]
    }
}
