//
//  TheaterInfo.swift
//  CGV
//
//  Created by 최안용 on 11/19/24.
//

import Foundation

struct TheaterInfo {
    let theaterName: String
    let theaterId: Int
    var auditoriumType: [(String, String)] {
        if theaterId == 1 {
            return [
                ("1관", "2D"),
                ("1관", "2D"),
                ("1관", "2D"),
                ("1관", "2D"),
                ("1관", "2D"),
                ("1관", "2D")
            ]
        } else if theaterId == 2 {
            return [
                ("1관", "IMAX"),
                ("1관", "IMAX"),
                ("1관", "IMAX"),
                ("1관", "IMAX"),
                ("2관", "2D"),
                ("2관", "2D")
            ]
        } else {
            return [
                ("1관", "IMAX"),
                ("1관", "IMAX"),
                ("1관", "IMAX"),
                ("1관", "IMAX"),
                ("2관", "2D"),
                ("2관", "2D")
            ]
        }
    }
}


