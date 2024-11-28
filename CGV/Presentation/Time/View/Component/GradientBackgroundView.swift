//
//  GradientBackgroundView.swift
//  CGV
//
//  Created by 최안용 on 11/26/24.
//

import SwiftUI

struct GradientBackgroundView: View {
    
    // MARK: - View
    
    var body: some View {
        VStack(spacing: 0) {
            LinearGradient(
                colors: [
                    Color(hex: "#FA4356"),
                    Color(hex: "#EF642F")
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(height: Screen.height(221))
            
            Color.cgvWhite
        }
    }
}
