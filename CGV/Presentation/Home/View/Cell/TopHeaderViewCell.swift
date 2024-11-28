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
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
