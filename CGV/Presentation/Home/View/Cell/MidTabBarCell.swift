//
//  MidTabBarCell.swift
//  CGV
//
//  Created by 김송희 on 11/21/24.
//

import UIKit

import SnapKit
import Then

final class MidTabBarCell: BaseCollectionViewCell {
    
    // MARK: - Property
    
    private let tabNameLabel = UILabel()
    private let underlineView = UIView()
    
    // MARK: - UISetting
    
    override func setStyle() {
        tabNameLabel.do {
            $0.setText(style: Kopub.body3, color: .cgvG900)
            $0.textAlignment = .center
        }
        
        underlineView.do {
            $0.backgroundColor = .black
        }
    }
    
    override func setUI() {
        contentView.addSubviews(tabNameLabel, underlineView)
    }
    
    override func setLayout() {
        tabNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalTo(tabNameLabel.snp.width).offset(Screen.width(16))
            $0.top.equalTo(tabNameLabel.snp.bottom).offset(Screen.height(7))
            $0.leading.equalToSuperview()
        }
    }
    
    // MARK: - Configure
    
    func configure(title: String, isSelected: Bool) {
        tabNameLabel.setText(
            title,
            style: Kopub.body3,
            color: isSelected ? .cgvG900 : .cgvG600
        )
        underlineView.backgroundColor = isSelected ? .black : .clear
    }
}
