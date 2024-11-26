//
//  MidTabBarView.swift
//  CGV
//
//  Created by 김송희 on 11/21/24.
//

import UIKit

import SnapKit
import Then

final class MidTabBarView: UICollectionReusableView, ReuseIdentifiable {
    
    // MARK: - Property
    
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 8
        }
    )
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UISetting
    
    private func setStyle() {
        collectionView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
    }
    
    private func setUI() {
        addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Update
    
    func updateTabs() {
        collectionView.reloadData()
    }
}
