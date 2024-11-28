//
//  ReserveRateCell.swift
//  CGV
//
//  Created by 김송희 on 11/21/24.
//

import UIKit

import SnapKit
import Then

final class ReserveRateCell: BaseCollectionViewCell {
    
    // MARK: - Property
    
    private let underView = UIView()
    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()
    private let rateLabel = UILabel()
    private let reserveButton = UIButton()
    
    // MARK: - UISetting
    
    override func setStyle() {
        underView.do {
            $0.backgroundColor = .cgvG200
            $0.layer.cornerRadius = 4
        }
        
        posterImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.setText(style: Kopub.head3, color: .cgvG800)
        }
        
        rateLabel.do {
            $0.setText(style: Kopub.body2, color: .cgvG700)
        }
        
        reserveButton.do {
            $0.setTitle("예매", style: Kopub.body3, color: .white)
            $0.backgroundColor = .cgvR200
            $0.layer.cornerRadius = 4
        }
    }
    
    override func setUI() {
        addSubviews(underView, posterImageView, titleLabel, rateLabel, reserveButton)
    }
    
    override func setLayout() {
        underView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        posterImageView.snp.makeConstraints{
            $0.leading.top.equalToSuperview()
            $0.width.equalTo(Screen.width(41))
            $0.height.equalTo(Screen.height(58))
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(posterImageView.snp.trailing).offset(Screen.width(14))
            $0.top.equalToSuperview().inset(Screen.height(11))
        }
        
        rateLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
        
        reserveButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(Screen.width(8))
            $0.centerY.equalTo(posterImageView.snp.centerY)
            $0.width.equalTo(Screen.width(32))
            $0.height.equalTo(Screen.height(24))
        }
    }
    
    // MARK: - Configure
    
    func configure(title: String, rate: String, image: UIImage?) {
        titleLabel.updateText(title)
        rateLabel.updateText(rate)
        posterImageView.image = image
    }
}
