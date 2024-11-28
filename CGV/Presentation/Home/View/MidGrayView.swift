//
//  MidGrayView.swift
//  CGV
//
//  Created by 김송희 on 11/26/24.
//

import UIKit

final class MidGrayView: UICollectionReusableView, ReuseIdentifiable {

    private let grayView = UIView()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UISetting
    
    private func setStyle() {
        grayView.backgroundColor = UIColor(resource: .cgvG100)
    }
    
    private func setUI() {
        addSubview(grayView)
    }
    
    private func setLayout() {
        grayView.snp.makeConstraints{
            $0.width.equalTo(Screen.width(375))
            $0.edges.equalToSuperview()
        }
    }
}
