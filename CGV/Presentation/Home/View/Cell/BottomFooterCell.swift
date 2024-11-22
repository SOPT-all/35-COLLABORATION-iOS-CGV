//
//  BottomFooterCell.swift
//  CGV
//
//  Created by 김송희 on 11/22/24.
//

import UIKit

class BottomFooterCell: BaseCollectionViewCell {
    
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    private let buttonStackView = UIStackView()
    private let userRuleButton = UIButton()
    private let dataRuleButton = UIButton()
    private let locationRuleButton = UIButton()
    private let lawRuleButton = UIButton()
    private let firstDivider = UILabel()
    private let secondDivider = UILabel()
    private let thirdDivider = UILabel()
    
    override func setStyle() {
        self.backgroundColor = UIColor(resource: .cgvG100)
        
        titleLabel.do {
            $0.setText(style: Malgun.head1, color: .cgvBlack)
        }
        
        iconImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.spacing = 7
            $0.alignment = .center
        }
        
        userRuleButton.do {
            $0.setTitle("이용약관", style: Kopub.body1, color: .cgvG800)
            $0.backgroundColor = .clear
        }
        
        dataRuleButton.do {
            $0.setTitle("개인정보 처리방침", style: Kopub.head1, color: .cgvG800)
            $0.backgroundColor = .clear
        }
        
        locationRuleButton.do {
            $0.setTitle("위치기반서비스 이용약관", style: Kopub.body1, color: .cgvG800)
            $0.backgroundColor = .clear
        }
        
        lawRuleButton.do {
            $0.setTitle("법적고지", style: Kopub.body1, color: .cgvG800)
            $0.backgroundColor = .clear
        }
        
        firstDivider.do {
            $0.backgroundColor = UIColor(resource: .cgvG500)
        }
        
        secondDivider.do {
            $0.backgroundColor = UIColor(resource: .cgvG500)
        }
        
        thirdDivider.do {
            $0.backgroundColor = UIColor(resource: .cgvG500)
        }
    }
    
    override func setUI() {
        addSubviews(titleLabel, iconImageView, buttonStackView)
        buttonStackView.addArrangedSubviews(userRuleButton, firstDivider, dataRuleButton, secondDivider, locationRuleButton, thirdDivider, lawRuleButton)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(33)
            $0.leading.equalToSuperview().inset(20)
        }
        
        iconImageView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.top).offset(7)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.size.equalTo(18)
        }
        
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(16)
        }
        
        userRuleButton.snp.makeConstraints{
            $0.width.equalTo(35)
            $0.height.equalTo(16)
        }
        
        dataRuleButton.snp.makeConstraints{
            $0.width.equalTo(73)
            $0.height.equalTo(16)
        }
        
        locationRuleButton.snp.makeConstraints{
            $0.width.equalTo(99)
            $0.height.equalTo(16)
        }
        
        lawRuleButton.snp.makeConstraints{
            $0.width.equalTo(35)
            $0.height.equalTo(16)
        }
        
        firstDivider.snp.makeConstraints{
            $0.width.equalTo(1)
            $0.height.equalTo(8)
            $0.centerY.equalToSuperview()
        }
        
        secondDivider.snp.makeConstraints{
            $0.width.equalTo(1)
            $0.height.equalTo(8)
            $0.centerY.equalToSuperview()
        }
        
        thirdDivider.snp.makeConstraints{
            $0.width.equalTo(1)
            $0.height.equalTo(8)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure(title: String, image: UIImage) {
        titleLabel.setText(title, style: Malgun.head1, color: .cgvBlack)
        iconImageView.image = image
    }
    
}
