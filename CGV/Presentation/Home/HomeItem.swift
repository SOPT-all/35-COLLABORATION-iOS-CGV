//
//  HomeItem.swift
//  CGV
//
//  Created by 김송희 on 11/19/24.
//

import UIKit

enum HomeSectionType: Int, CaseIterable {
    case banner
    case movieChart
    case special
    case todayCGV
}

struct HomeItem: Hashable {
    let id = UUID()
    let section: HomeSectionType
    let title: String
    let ageLimit: UIImage?
    let preEgg: String?
    let dDay: String?
    let image: UIImage?
    
    init(section: HomeSectionType,
         title: String,
         ageLimit: UIImage? = nil,
         preEgg: String? = nil,
         dDay: String? = nil,
         image: UIImage? = nil
    ) {
        self.section = section
        self.title = title
        self.ageLimit = ageLimit
        self.preEgg = preEgg
        self.dDay = dDay
        self.image = image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension HomeSectionType {
    var headerTitle: String {
        switch self {
        case .banner: return ""
        case .movieChart: return "무비 차트"
        case .special: return "특별관"
        case .todayCGV: return "오늘의 CGV"
        }
    }
}

extension HomeItem {
    static let dummyItems: [HomeItem] = [
        // Banner section items
        HomeItem(
            section: .banner,
            title: "",
            image: UIImage(resource: .imgHomeAd1)
        ),
        
        // Movie chart section items
        HomeItem(
            section: .movieChart,
            title: "청설",
            ageLimit: UIImage(resource: .icHomeAgeall22),
            preEgg: "99%",
            dDay: "D-1",
            image: UIImage(resource: .imgHomePoster1)
        ),
        HomeItem(
            section: .movieChart,
            title: "글래디에이터 II",
            ageLimit: UIImage(resource: .icHomeAge1922),
            preEgg: "99%",
            dDay: "D-1",
            image: UIImage(resource: .imgHomePoster2)
        ),
        HomeItem(
            section: .movieChart,
            title: "대도시의 사랑법",
            ageLimit: UIImage(resource: .icHomeAge1922),
            preEgg: "99%",
            dDay: "D-1",
            image: UIImage(resource: .imgHomePoster3)
        ),
        HomeItem(
            section: .movieChart,
            title: "베놈 : 라스트 댄스",
            ageLimit: UIImage(resource: .icHomeAge1522),
            preEgg: "99%",
            dDay: "D-1",
            image: UIImage(resource: .imgHomePoster4)
        ),
        HomeItem(
            section: .movieChart,
            title: "히든페이스",
            ageLimit: UIImage(resource: .icHomeAge1922),
            preEgg: "99%",
            dDay: "D-1",
            image: UIImage(resource: .imgHomePoster6)
        ),
        HomeItem(
            section: .movieChart,
            title: "괴물",
            ageLimit: UIImage(resource: .icHomeAge1222),
            preEgg: "99%",
            dDay: "D-1",
            image: UIImage(resource: .imgHomePoster7)
        ),
        HomeItem(
            section: .movieChart,
            title: "아메바 소녀들과 학교괴담",
            ageLimit: UIImage(resource: .icHomeAge1522),
            preEgg: "99%",
            dDay: "D-1",
            image: UIImage(resource: .imgHomePoster8)
        ),
        HomeItem(
            section: .movieChart,
            title: "캐롤",
            ageLimit: UIImage(resource: .icHomeAge1922),
            preEgg: "99%",
            dDay: "D-1",
            image: UIImage(resource: .imgHomePoster9)
        ),

        // Special section items
        HomeItem(
            section: .special,
            title: "",
            image: UIImage(resource: .imgHomeImax1)
        ),
        HomeItem(
            section: .special,
            title: "",
            image: UIImage(resource: .imgHomeImax2)
        ),
        HomeItem(
            section: .special,
            title: "",
            image: UIImage(resource: .imgHomeImax3)
        ),
        HomeItem(
            section: .special,
            title: "",
            image: UIImage(resource: .imgHomeImax4)
        ),
        
        // Today CGV section items
        HomeItem(
            section: .todayCGV,
            title: "",
            image: UIImage(resource: .imgHomeHot1)
        ),
        HomeItem(
            section: .todayCGV,
            title: "",
            image: UIImage(resource: .imgHomeHot2)
        ),
        HomeItem(
            section: .todayCGV,
            title: "",
            image: UIImage(resource: .imgHomeHot3)
        ),
        HomeItem(
            section: .todayCGV,
            title: "",
            image: UIImage(resource: .imgHomeHot4)
        )
    ]
}

