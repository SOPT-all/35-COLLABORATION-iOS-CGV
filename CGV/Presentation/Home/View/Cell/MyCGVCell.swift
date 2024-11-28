//
//  MyCGVCell.swift
//  CGV
//
//  Created by 김송희 on 11/22/24.
//

import UIKit

final class MyCGVCell: BaseCollectionViewCell {
    
    // MARK: - Property
    
    private let underView = UIView()
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private let rateLabel = UILabel()
    
    // MARK: - UISetting
    
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
        }
        
        iconView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(Screen.height(11))
            $0.leading.equalToSuperview().inset(Screen.width(13))
            $0.width.equalTo(Screen.width(28))
            $0.height.equalTo(Screen.height(28))
        }
        
        titleLabel.snp.makeConstraints{
            $0.centerY.equalTo(iconView.snp.centerY)
            $0.leading.equalTo(iconView.snp.trailing).offset(Screen.width(8))
        }
        
        rateLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(Screen.width(11))
            $0.centerY.equalTo(iconView.snp.centerY)
        }
    }
    
    // MARK: - Configure
    
    func configure(title: String, rate: String, image: UIImage?) {
        titleLabel.updateText(title)
        rateLabel.updateText(rate)
        iconView.image = image
    }
}
