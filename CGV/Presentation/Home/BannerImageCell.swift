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
    
    override func setStyle() {
        bannerImageView.do {
            $0.contentMode = .scaleAspectFit
        }
    }
    
    override func setUI() {
        self.addSubviews(bannerImageView)
    }
    
    override func setLayout() {
        bannerImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(100)
        }
    }
    
    func configure(image: UIImage?) {
        bannerImageView.image = image
    }
}
