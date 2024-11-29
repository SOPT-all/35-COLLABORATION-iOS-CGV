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
    
    func setHighlightText<T: FontStyle>(_ words: String..., style: T, color: UIColor? = nil) {
        guard let currentAttributedText = attributedText else { return }
        
        let mutableAttributedString = NSMutableAttributedString(
            attributedString: currentAttributedText
        )
        let textColor = textColor ?? .black
        
        for word in words {
            let range = (currentAttributedText.string as NSString).range(of: word)
            
            if range.location != NSNotFound {
                let highlightedAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.setupFont(of: style),
                    .foregroundColor: color ?? textColor
                ]
                mutableAttributedString.addAttributes(highlightedAttributes, range: range)
                attributedText = mutableAttributedString
            }
        }
    }
}
