//
//  NSAttributedString+.swift
//  CGV
//
//  Created by 예삐 on 11/18/24.
//

import UIKit

extension NSAttributedString {
    static func setupFontStyle<T: FontStyle>(
        _ text: String = "",
        style: T
    ) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = style.lineHeight
        paragraphStyle.minimumLineHeight = style.lineHeight
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.setupFont(of: style),
            .baselineOffset: style.baselineOffset
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}
