//
//  UIStackView+.swift
//  CGV
//
//  Created by 예삐 on 11/18/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
