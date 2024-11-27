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
    
    private let safeAreaView = UIView()
    
    // MARK: - UISetting
    
    override func setStyle() {
        safeAreaView.do {
            $0.backgroundColor = .white
        }
        
        collectionView.do {
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    override func setUI() {
        addSubviews(collectionView, safeAreaView)
    }
    
    override func setLayout() {
        safeAreaView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(safeAreaView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
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
                forSupplementaryViewOfKind: "MidHeader",
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
            $0.register(
                MidGrayView.self,
                forSupplementaryViewOfKind: "MidGray",
                withReuseIdentifier: MidGrayView.reuseIdentifier
            )
        }
    }
}

