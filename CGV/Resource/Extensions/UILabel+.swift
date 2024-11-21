//
//  UILabel+.swift
//  CGV
//
//  Created by 예삐 on 11/18/24.
//

import UIKit

extension UILabel {
    func setText<T: FontStyle>(
        _ text: String = " ",
        style: T,
        color: UIColor,
        isSingleLine: Bool = false
    ) {
        attributedText = .setupFontStyle(text.isEmpty ? " " : text, style: style)
        textColor = color
        if isSingleLine {
            numberOfLines = 1
            lineBreakMode = .byTruncatingTail
        } else {
            numberOfLines = 0
        }
    }
    
    func updateText(_ text: String?) {
        guard let currentAttributes = attributedText?.attributes(at: 0, effectiveRange: nil) else {
            self.text = text
            return
        }
        attributedText = NSAttributedString(string: text ?? " ", attributes: currentAttributes)
    }
}
