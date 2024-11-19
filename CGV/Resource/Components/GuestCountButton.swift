//
//  GuestCountButton.swift
//  CGV
//
//  Created by 예삐 on 11/19/24.
//

import UIKit

import Then
import SnapKit

final class GuestCountButton: UIView {
    static let defaultWidth: CGFloat = 100
    static let defaultHeight: CGFloat = 42
    
    private let countView = UIView()
    
    private let minusButton = UIButton()
    
    private let plusButton = UIButton()
    
    private let countLabel = UILabel()
    
    init(count: Int = 0) {
        super.init(frame: .zero)
        
        setCountLabel(count: count)
        setStyle()
        setUI()
        setLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setCountLabel(count: Int) {
        countLabel.setText(
            count.description,
            style: Kopub.head6,
            color: .cgvG700,
            isSingleLine: true
        )
    }
    
    private func setStyle() {
        backgroundColor = .cgvG200
        layer.cornerRadius = 8
        
        countView.do {
            $0.backgroundColor = .cgvWhite
            $0.layer.cornerRadius = 8
        }
        
        minusButton.do {
            $0.setImage(.icSeatsMinus, for: .normal)
        }
        
        plusButton.do {
            $0.setImage(.icSeatsPlus, for: .normal)
        }
    }
    
    private func setUI() {
        addSubviews(countView, countLabel, minusButton, plusButton)
    }
    
    private func setLayout() {
        countView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(34)
        }
        
        countLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        minusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
            $0.size.equalTo(20)
        }
        
        plusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
            $0.size.equalTo(20)
        }
    }
}
