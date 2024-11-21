//
//  SeatsView.swift
//  CGV
//
//  Created by 예삐 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class SeatsView: BaseView {
    
    // MARK: - UIComponent

    let seatsCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    })
    
    let seatsImage = UIButton()
    
    // MARK: - UISetting
    
    override func setStyle() {
        seatsCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.contentInsetAdjustmentBehavior = .never
        }
        
        seatsImage.do {
            $0.setImage(.imgSeatsUnselected, for: .normal)
        }
    }
    
    override func setUI() {
        addSubviews(seatsCollectionView, seatsImage)
    }
    
    override func setLayout() {
        seatsCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        seatsImage.snp.makeConstraints {
            $0.top.equalTo(seatsCollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.width * (641/375))
        }
    }
}
