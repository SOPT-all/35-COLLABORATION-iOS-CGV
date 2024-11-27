//
//  TopViewCellCollectionViewCell.swift
//  CGV
//
//  Created by 김송희 on 11/20/24.
//

import UIKit

import SnapKit
import Then

final class TopHeaderViewCell: BaseCollectionViewCell {
    
    // MARK: - Property
    
    private let topView = TopHeaderView()
    
    // MARK: - UISetting
    
    override func setUI() {
        contentView.addSubview(topView)
    }
    
    override func setLayout() {
        topView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Screen.height(12))
            $0.leading.equalToSuperview().inset(Screen.width(20))
            $0.trailing.equalToSuperview().inset(Screen.width(10))
            $0.bottom.equalToSuperview()
        }
    }
}
