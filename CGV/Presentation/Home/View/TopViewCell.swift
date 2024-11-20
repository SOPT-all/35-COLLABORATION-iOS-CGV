//
//  TopViewCellCollectionViewCell.swift
//  CGV
//
//  Created by 김송희 on 11/20/24.
//

import UIKit

import SnapKit
import Then

class TopViewCell: BaseCollectionViewCell {
    
    private let topView = TopView()
    
    override func setUI() {
        contentView.addSubview(topView)
    }
    
    override func setLayout() {
        topView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
    }
}
