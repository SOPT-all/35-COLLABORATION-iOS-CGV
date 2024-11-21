//
//  ReuseIdentifable.swift
//  CGV
//
//  Created by 예삐 on 11/18/24.
//

import Foundation

protocol ReuseIdentifiable {}

extension ReuseIdentifiable {
    static var reuseIdentifier: String { String(describing: self) }
}
