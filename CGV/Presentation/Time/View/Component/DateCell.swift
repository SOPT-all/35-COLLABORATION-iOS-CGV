//
//  DateCell.swift
//  CGV
//
//  Created by 최안용 on 11/26/24.
//

import SwiftUI

struct DateCell: View {
    
    // MARK: - Property
    
    private let date: DateInfo
    private var isSelected: Bool {
        date.dateString == "오늘"
    }
    private var textColor: Color {
        if date.dateString == "오늘" || date.dateString == "일" {
            return .cgvR400
        } else if date.dateString == "토" {
            return .cgvBlue
        } else {
            return .cgvG700
        }
    }
    
    init(date: DateInfo) {
        self.date = date
    }
    
    // MARK: - View
    
    var body: some View {
        VStack(spacing: Screen.height(4)) {
            Text(date.dateNum)
                .font(Font(uiFont: .kopub(.head5)))
                .foregroundStyle(isSelected ? .cgvWhite : .cgvBlack)
                .frame(width: Screen.width(40), height: Screen.height(40))
                .background {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(isSelected ? .cgvR400 : .cgvWhite)
                }
            Text(date.dateString)
                .foregroundStyle(textColor)
                .font(Font(uiFont: .kopub(isSelected ? .head2 : .body3)))
        }
    }
}
