//
//  Font+.swift
//  CGV
//
//  Created by 최안용 on 11/26/24.
//

import SwiftUI

extension Font {
    init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}
