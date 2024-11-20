//
//  BannerImageCell.swift
//  CGV
//
//  Created by 김송희 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class BannerImageCell: BaseCollectionViewCell {
    private let bannerImageView = UIImageView()
    private let countLabel = UILabel()
    
    override func setStyle() {
        bannerImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        countLabel.do {
            $0.setText("2 / 9", style: Kopub.head1, color: .white)
            $0.backgroundColor = UIColor(resource: .cgvG700)
            $0.textAlignment = .center
        }
    }
    
    override func setUI() {
        self.addSubviews(bannerImageView, countLabel)
    }
    
    override func setLayout() {
        bannerImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(100)
        }
        
        countLabel.snp.makeConstraints{
            $0.bottom.equalTo(bannerImageView.snp.bottom)
            $0.trailing.equalTo(bannerImageView.snp.trailing)
            $0.width.equalTo(33)
            $0.height.equalTo(18)
        }
    }
    
    func configure(image: UIImage?) {
        bannerImageView.image = image
    }
}
