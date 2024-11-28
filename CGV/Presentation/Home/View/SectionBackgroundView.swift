//
//  SectionBackgroundView.swift
//  CGV
//
//  Created by 김송희 on 11/28/24.
//

import UIKit

class SectionBackgroundView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
