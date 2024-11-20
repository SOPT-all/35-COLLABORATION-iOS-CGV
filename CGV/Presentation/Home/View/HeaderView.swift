//
//  HeaderCell.swift
//  CGV
//
//  Created by 김송희 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class HeaderView: UICollectionReusableView {
    
    static let identifier = "HeaderView"
    private let titleLabel = UILabel()
    private let allViewButton = UIButton()
    private let allViewTextLabel = UILabel()
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
    
    // MARK: - Setup Methods
    
    private func setStyle() {
        titleLabel.do {
            $0.setText(style: Kopub.head7, color: .cgvBlack)
        }
        
        allViewButton.do {
            $0.backgroundColor = .clear
        }
        
        allViewTextLabel.do {
            $0.setText("전체보기", style: Kopub.body3, color: .cgvG700)
        }
        
        chevronImageView.do {
            $0.image = UIImage(resource: .icHomeArrowRight)
            $0.tintColor = UIColor(resource: .cgvG700)
        }
    }
    
    private func setUI() {
        self.addSubviews(titleLabel, allViewButton)
        allViewButton.addSubviews(allViewTextLabel, chevronImageView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalToSuperview()
        }
        
        allViewButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(58)
            $0.height.equalTo(18)
        }
        
        allViewTextLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        chevronImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(11)
            $0.height.equalTo(18)
        }
    }
    
    func configure(title: String) {
        titleLabel.setText(title, style: Kopub.head7, color: .cgvBlack)
    }
}

