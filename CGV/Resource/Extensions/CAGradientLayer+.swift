//
//  CAGradientLayer+.swift
//  CGV
//
//  Created by 예삐 on 11/18/24.
//

import UIKit

enum Gradient {
    case cgv
    case modal
}

extension CAGradientLayer {
    static func gradientLayer(for style: Gradient, in frame: CGRect) -> Self {
        let layer = Self()
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }
    
    private static func colors(for style: Gradient) -> [CGColor] {
        let beginColor: UIColor
        let endColor: UIColor
        
        switch style {
        case .cgv:
            beginColor = UIColor(hexCode: "#FA4356")
            endColor = UIColor(hexCode: "#FF642F")
        case .modal:
            beginColor = UIColor(hexCode: "#000000", alpha: 1.0)
            endColor = UIColor(hexCode: "#000000", alpha: 0.0)
        }
        
        return [beginColor.cgColor, endColor.cgColor]
    }
}
