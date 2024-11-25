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
    
    // MARK: - Property
    
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - UISetting
    
    override func setUI() {
        addSubview(collectionView)
        
        collectionView.do {
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Register
    
    func setRegister() {
        collectionView.do {
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
                withReuseIdentifier: MidHeaderView.reuseIdentifier
            )
            $0.register(
                MidTabBarView.self,
                forSupplementaryViewOfKind: "MidTabBar",
                withReuseIdentifier: MidTabBarView.reuseIdentifier
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
            $0.register(
                ProgressShareCell.self,
                forCellWithReuseIdentifier: ProgressShareCell.reuseIdentifier
            )
        }
    }
}

