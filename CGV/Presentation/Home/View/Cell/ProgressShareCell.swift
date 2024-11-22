//
//  ProgressShareCell.swift
//  CGV
//
//  Created by 김송희 on 11/22/24.
//

import UIKit

class ProgressShareCell: BaseCollectionViewCell {
    
    private let progressStackView = UIStackView()
    private let firstLabel = UILabel()
    private let secondLabel = UILabel()
    private let thirdLabel = UILabel()
    private let fourthLabel = UILabel()
    private let shareButton = UIButton()
    
    override func setStyle() {        
        [firstLabel, secondLabel, thirdLabel, fourthLabel].forEach { label in
            label.text = "●"
            label.font = .systemFont(ofSize: 7, weight: .medium)
            label.textAlignment = .center
            label.textColor = UIColor(resource: .cgvG400)
        }
        
        firstLabel.textColor = UIColor(resource: .cgvG700)
        
        progressStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .center
        }
        
        shareButton.do {
            $0.setImage(UIImage(resource: .icHomeShare), for: .normal)
            $0.tintColor = .cgvBlack
        }
    }
    
    override func setUI() {
        addSubviews(progressStackView, shareButton)
        progressStackView.addArrangedSubviews(firstLabel, secondLabel, thirdLabel, fourthLabel)
    }
    
    override func setLayout() {
        progressStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        shareButton.snp.makeConstraints{
            $0.size.equalTo(30)
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure(to index: Int) {
        [firstLabel, secondLabel, thirdLabel, fourthLabel].forEach {
            $0.textColor = UIColor(resource: .cgvG400)
        }
        
        switch index {
        case 0:
            firstLabel.textColor = UIColor(resource: .cgvG700)
        case 1:
            secondLabel.textColor = UIColor(resource: .cgvG700)
        case 2:
            thirdLabel.textColor = UIColor(resource: .cgvG700)
        case 3:
            fourthLabel.textColor = UIColor(resource: .cgvG700)
        default:
            break
        }
    }
}
