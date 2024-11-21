//
//  MyCGVCell.swift
//  CGV
//
//  Created by 김송희 on 11/22/24.
//

import UIKit

class MyCGVCell: BaseCollectionViewCell {
    
    private let underView = UIView()
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private let rateLabel = UILabel()
    
    override func setStyle() {
        underView.do {
            $0.backgroundColor = .cgvG200
            $0.layer.cornerRadius = 8
        }
        
        iconView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.setText(style: Kopub.head4, color: .cgvG850)
        }
        
        rateLabel.do {
            $0.setText(style: Kopub.head4, color: .cgvG850)
        }
    }
    
    override func setUI() {
        addSubviews(underView, iconView, titleLabel, rateLabel)
    }
    
    override func setLayout() {
        underView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(50)
        }
        
        iconView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(13)
            $0.size.equalTo(28)
        }
        
        titleLabel.snp.makeConstraints{
            $0.centerY.equalTo(iconView.snp.centerY)
            $0.leading.equalTo(iconView.snp.trailing).offset(8)
        }
        
        rateLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(11)
            $0.centerY.equalTo(iconView.snp.centerY)
        }
    }
    
    func configure(title: String, rate: String, image: UIImage?) {
        titleLabel.setText(title, style: Kopub.head4, color: .cgvG850)
        rateLabel.setText(rate, style: Kopub.head4, color: .cgvG850)
        iconView.image = image
    }
}
