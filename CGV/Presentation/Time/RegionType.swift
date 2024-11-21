//
//  RegionType.swift
//  CGV
//
//  Created by 최안용 on 11/19/24.
//

import Foundation

enum RegionType: CaseIterable {
    case suggestion
    case seoul
    case gyeonggi
    case incheon
    case gangwon
    case daejeonAndChungcheong
    case daegu
    case busanAndUlsan
    case gyeongsang
    case gwangjuAndJeollaAndJeju

    var title: String {
        switch self {
        case .suggestion: return "추천 CGV"
        case .seoul: return "서울"
        case .gyeonggi: return "경기"
        case .incheon: return "인천"
        case .gangwon: return "강원"
        case .daejeonAndChungcheong: return "대전/충청"
        case .daegu: return "대구"
        case .busanAndUlsan: return "부산/울산"
        case .gyeongsang: return "경상"
        case .gwangjuAndJeollaAndJeju: return "광주/전라/제주"
        }
    }
    
    var count: Int? {
        switch self {
        case .suggestion: return nil
        case .seoul: return 31
        case .gyeonggi: return 59
        case .incheon: return 11
        case .gangwon: return 5
        case .daejeonAndChungcheong: return 22
        case .daegu: return 9
        case .busanAndUlsan: return 18
        case .gyeongsang: return 16
        case .gwangjuAndJeollaAndJeju: return 23
        }
    }
}
