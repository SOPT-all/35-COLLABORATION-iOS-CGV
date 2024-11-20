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
    
    // MARK: - Property

    static let defaultWidth: CGFloat = 100
    
    static let defaultHeight: CGFloat = 42
    
    var currentCount: Int {
        return Int(countLabel.text ?? "0") ?? 0
    }
    
    // MARK: - UIComponent

    private let countView = UIView()
    
    let minusButton = UIButton()
    
    let plusButton = UIButton()
    
    let countLabel = UILabel()
    
    // MARK: - Initializer
    
    init(count: Int = 0) {
        super.init(frame: .zero)
        
        setCountLabel(count: count)
        setAction()
        setStyle()
        setUI()
        setLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAction()
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setAction()
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - Function

    private func setCountLabel(count: Int) {
        countLabel.setText(
            count.description,
            style: Kopub.head6,
            color: .cgvG700,
            isSingleLine: true
        )
    }
    
    // MARK: - Action
    
    private func setAction() {
        minusButton.addTarget(self, action: #selector(minusButtonDidTap), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func minusButtonDidTap() {
        guard let countText = countLabel.text else { return }
        guard let count = Int(countText) else { return }
        
        if (count - 1) >= 0 && (count - 1) <= 8 {
            countLabel.updateText((count - 1).description)
        }
    }
    
    @objc
    private func plusButtonDidTap() {
        guard let countText = countLabel.text else { return }
        guard let count = Int(countText) else { return }
        
        if (count + 1) >= 0 && (count + 1) <= 8 {
            countLabel.updateText((count + 1).description)
        }
    }
}

// MARK: - UISetting

private extension GuestCountButton {
    func setStyle() {
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
    
    func setUI() {
        addSubviews(countView, countLabel, minusButton, plusButton)
    }
    
    func setLayout() {
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
