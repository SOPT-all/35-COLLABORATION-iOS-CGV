//
//  HomeView.swift
//  CGV
//
//  Created by 김송희 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func setUI() {
        addSubview(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setCollectionView() {
        collectionView.do {
            $0.showsVerticalScrollIndicator = false
            
            $0.register(
                TopHeaderViewCell.self,
                forCellWithReuseIdentifier: TopHeaderViewCell.reuseIdentifier
            )
            $0.register(
                TopTabBarCell.self,
                forCellWithReuseIdentifier: TopTabBarCell.reuseIdentifier
            )
            $0.register(
                MidHeaderView.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: MidHeaderView.identifier
            )
            $0.register(
                MidTabBarView.self,
                forSupplementaryViewOfKind: "TabBarKind",
                withReuseIdentifier: MidTabBarView.identifier
            )
            $0.register(
                MovieChartCell.self,
                forCellWithReuseIdentifier: MovieChartCell.reuseIdentifier
            )
            $0.register(
                BannerImageCell.self,
                forCellWithReuseIdentifier: BannerImageCell.reuseIdentifier
            )
            $0.register(
                BigImageCell.self,
                forCellWithReuseIdentifier: BigImageCell.reuseIdentifier
            )
            $0.register(
                MidHeaderView.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: MidHeaderView.identifier
            )
            $0.register(
                ReserveRateCell.self,
                forCellWithReuseIdentifier: ReserveRateCell.reuseIdentifier
            )
            $0.register(
                MyCGVCell.self,
                forCellWithReuseIdentifier: MyCGVCell.reuseIdentifier
            )
            $0.register(
                BottomFooterCell.self,
                forCellWithReuseIdentifier: BottomFooterCell.reuseIdentifier
            )
        }
    }
}

