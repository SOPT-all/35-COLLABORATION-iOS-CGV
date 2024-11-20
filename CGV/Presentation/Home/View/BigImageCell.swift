//
//  BigImageCell.swift
//  CGV
//
//  Created by 김송희 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class BigImageCell: BaseCollectionViewCell {
    private let bigImageView = UIImageView()
    
    override func setStyle() {
        bigImageView.do {
            $0.layer.cornerRadius = 20
            $0.contentMode = .scaleAspectFit
        }
    }
    
    override func setUI() {
        self.addSubviews(bigImageView)
    }
    
    override func setLayout() {
        bigImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    func configure(image: UIImage?) {
        bigImageView.image = image
    }
}

