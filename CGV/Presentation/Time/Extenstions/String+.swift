//
//  String+.swift
//  CGV
//
//  Created by 최안용 on 12/1/24.
//

import Foundation

extension String {
    func toTime() -> String {
        let components = self.split(separator: "T")
        guard components.count == 2 else { return "" }

        let timeComponents = components[1].split(separator: ":")
        guard timeComponents.count >= 2 else { return "" }

        return "\(timeComponents[0]):\(timeComponents[1])"
    }
}
