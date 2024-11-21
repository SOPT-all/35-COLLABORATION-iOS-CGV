//
//  ReserveRateCell.swift
//  CGV
//
//  Created by 김송희 on 11/21/24.
//

import UIKit

import SnapKit
import Then

class ReserveRateCell: BaseCollectionViewCell {
    
    private let underView = UIView()
    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()
    private let rateLabel = UILabel()
    private let reserveButton = UIButton()
    
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
            $0.setTitle("예매", for: .normal)
            $0.backgroundColor = .cgvR200
        }
    }
    
    override func setUI() {
        addSubviews(underView, posterImageView, titleLabel, rateLabel, reserveButton)
    }
    
    override func setLayout() {
        underView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(58)
        }
        
        posterImageView.snp.makeConstraints{
            $0.leading.top.equalToSuperview()
            $0.width.equalTo(41)
            $0.height.equalTo(58)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(posterImageView.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(11)
        }
        
        rateLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
        
        reserveButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(8)
            $0.width.equalTo(32)
            $0.height.equalTo(24)
        }
    }
    
    func configure(title: String, rate: String, image: UIImage?) {
        titleLabel.setText(title, style: Kopub.head3, color: .cgvG800)
        rateLabel.setText(rate, style: Kopub.body2, color: .cgvG700)
        posterImageView.image = image
    }
}
