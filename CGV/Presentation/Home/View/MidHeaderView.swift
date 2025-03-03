//
//  MidHeaderView.swift
//  CGV
//
//  Created by 김송희 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class MidHeaderView: UICollectionReusableView, ReuseIdentifiable {
    
    // MARK: - Property
    
    private let titleLabel = UILabel()
    private let allViewButton = UIButton()
    private let subtitleLabel = UILabel()
    private let chevronImageView = UIImageView()
    
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
        titleLabel.do {
            $0.setText(style: Kopub.head7, color: .cgvBlack)
        }
        
        allViewButton.do {
            $0.backgroundColor = .clear
        }
        
        subtitleLabel.do {
            $0.setText("전체보기", style: Kopub.body3, color: .cgvG700)
        }
        
        chevronImageView.do {
            $0.image = UIImage(resource: .icHomeArrowRight)
            $0.tintColor = UIColor(resource: .cgvG700)
        }
    }
    
    private func setUI() {
        addSubviews(titleLabel, allViewButton)
        allViewButton.addSubviews(subtitleLabel, chevronImageView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Screen.height(22))
            $0.leading.equalToSuperview()
        }
        
        allViewButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(Screen.width(72))
            $0.height.equalTo(Screen.height(18))
        }
        
        subtitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalTo(chevronImageView.snp.leading).offset(Screen.width(-5))
        }
        
        chevronImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Screen.height(2))
            $0.trailing.equalToSuperview()
            $0.width.equalTo(Screen.width(11))
            $0.height.equalTo(Screen.height(18))
        }
    }
    
    // MARK: - Configure
    
    func configure(title: String, subtitle: String) {
        titleLabel.updateText(title)
        subtitleLabel.updateText(subtitle)
    }
}

