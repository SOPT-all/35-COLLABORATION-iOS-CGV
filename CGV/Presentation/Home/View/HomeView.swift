//
//  HomeView.swift
//  CGV
//
//  Created by 김송희 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupCollectionView() {
        collectionView.do {
            $0.register(
                TopHeaderViewCell.self,
                forCellWithReuseIdentifier:           TopHeaderViewCell.reuseIdentifier
            )
            $0.register(
                TopTabBarCell.self,
                forCellWithReuseIdentifier:           TopTabBarCell.reuseIdentifier
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
        }
    }
}

