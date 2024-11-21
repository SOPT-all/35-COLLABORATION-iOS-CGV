//
//  UIFont+.swift
//  CGV
//
//  Created by 예삐 on 11/18/24.
//

import UIKit

protocol FontStyle {
    var weight: String { get }
    var size: CGFloat { get }
    var lineHeight: CGFloat { get }
    var baselineOffset: CGFloat { get }
}

extension UIFont {
    static func kopub(_ style: Kopub) -> UIFont {
        return UIFont(name: style.weight, size: style.size) ?? .systemFont(ofSize: style.size)
    }
    
    static func malgun(_ style: Malgun) -> UIFont {
        return UIFont(name: style.weight, size: style.size) ?? .systemFont(ofSize: style.size)
    }
    
    static func setupFont<T: FontStyle>(of style: T) -> UIFont {
        switch style {
        case let kopub as Kopub:
            return UIFont.kopub(kopub)
        case let malgun as Malgun:
            return UIFont.malgun(malgun)
        default:
            return .systemFont(ofSize: style.size)
        }
    }
}

enum Kopub: FontStyle {
    case head1, head2, head3, head4, head5, head6, head7, head8
    case body1, body2, body3, body4, body5
    
    var weight: String {
        switch self {
        case .head1, .head2, .head3, .head4, .head5, .head6, .head7, .head8:
            "KoPubWorldDotumBold"
        case .body1, .body2, .body3, .body4, .body5:
            "KoPubWorldDotumMedium"
        }
    }
    
    var size: CGFloat {
        switch self {
        case .head1: 10
        case .head2: 12
        case .head3: 13
        case .head4: 14
        case .head5: 16
        case .head6: 17
        case .head7: 18
        case .head8: 20
        case .body1: 10
        case .body2: 11
        case .body3: 12
        case .body4: 14
        case .body5: 15
        }
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .head1: 16
        case .head2: 18
        case .head3: 20
        case .head4: 24
        case .head5: 20
        case .head6: 26
        case .head7: 24
        case .head8: 24
        case .body1: 10
        case .body2: 16
        case .body3: 18
        case .body4: 22
        case .body5: 24
        }
    }
    
    var baselineOffset: CGFloat { return (lineHeight - size) / 4 }
}

enum Malgun: FontStyle {
    case head1, head2, head3
    case body1, body2, body3, body4
    
    var weight: String {
        switch self {
        case .head1, .head2, .head3:
            "MalgunGothicBold"
        case .body1, .body2, .body3, .body4:
            "MalgunGothicRegular"
        }
    }
    
    var size: CGFloat {
        switch self {
        case .head1: 12
        case .head2: 16
        case .head3: 20
        case .body1: 10
        case .body2: 11
        case .body3: 12
        case .body4: 18
        }
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .head1: 24
        case .head2: 20
        case .head3: 24
        case .body1: 12
        case .body2: 15
        case .body3: 16
        case .body4: 24
        }
    }
    
    var baselineOffset: CGFloat { return (lineHeight - size) / 4 }
}
