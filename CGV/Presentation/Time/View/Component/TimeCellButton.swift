//
//  TimeCellButton.swift
//  CGV
//
//  Created by 최안용 on 11/26/24.
//

import SwiftUI

struct TimeCell: View {
    
    // MARK: - Property
    
    let timeInfo: TimeInfo
    var action: () -> Void
    
    init (timeInfo: TimeInfo, action: @escaping () -> Void) {
        self.timeInfo = timeInfo
        self.action = action
    }
    
    // MARK: - View
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(timeInfo.startTime)
                        .font(Font(uiFont: .malgun(.head2)))
                        .foregroundStyle(.cgvBlack)
                    
                    Text("~\(timeInfo.endTime)")
                        .font(Font(uiFont: .malgun(.body1)))
                        .foregroundStyle(.cgvG600)
                }
                .padding(.horizontal, Screen.width(8))
                .padding(.vertical, Screen.height(10))
                
                HStack(spacing: 0) {
                    Spacer()
                    
                    if timeInfo.isMorning {
                        Image(.icTimeSun)
                            .resizable()
                            .frame(width: Screen.width(16))
                    }
                    
                    Text(timeInfo.remainingSeats)
                        .font(Font(uiFont: .malgun(.body1)))
                        .foregroundStyle(.cgvGreen)
                    
                    Text("/\(timeInfo.totalSeat)석")
                        .font(Font(uiFont: .malgun(.body1)))
                        .foregroundStyle(.cgvBlack)
                    
                    Spacer()
                }
                .frame(width: Screen.width(90), height: Screen.height(16))
                .background(Color.cgvG100)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 7))
        .background {
            RoundedRectangle(cornerRadius: 7)
                .stroke(Color.cgvG200, lineWidth: 1)
        }
    }
}
