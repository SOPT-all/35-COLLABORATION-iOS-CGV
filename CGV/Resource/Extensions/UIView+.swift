//
//  UIView+.swift
//  CGV
//
//  Created by 예삐 on 11/18/24.
//

import UIKit

extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
