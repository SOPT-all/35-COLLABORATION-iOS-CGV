//
//  TopTapBarCell.swift
//  CGV
//
//  Created by 김송희 on 11/20/24.
//

import UIKit

final class TopTabBarCell: BaseCollectionViewCell {
    
    // MARK: - Property
    
    private let gradientView = UIView()
    private let stackView = UIStackView()
    private let underlineView = UIView()
    private let titles = ["홈", "이벤트", "패스트오더", "기프트샵", "@CGV"]
    private var buttons: [UIButton] = []
    
    private var selectedIndex: Int = 0 {
        didSet {
            updateButtonStyles()
        }
    }
    
    // MARK: - UISetting
    
    override func setStyle() {
        stackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .equalSpacing
            $0.spacing = Screen.width(14)
        }
        
        underlineView.do {
            $0.backgroundColor = .white
        }
        
        titles.forEach { title in
            let button = UIButton()
            button.do {
                $0.setTitle(title, for: .normal)
                $0.setTitleColor(.white, for: .normal)
                $0.setTitleColor(.red, for: .selected)
                $0.titleLabel?.font = UIFont.setupFont(of: Kopub.head4)
            }
            buttons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    override func setUI() {
        contentView.addSubviews(gradientView, stackView, underlineView)
    }
    
    override func setLayout() {
        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(Screen.width(16))
            $0.centerY.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints {
            $0.height.equalTo(Screen.height(2))
            $0.width.equalTo(Screen.width(29))
            $0.bottom.equalTo(gradientView.snp.bottom)
            $0.leading.equalToSuperview().inset(Screen.width(16))
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientView.setNeedsLayout()
        gradientView.layoutIfNeeded()
        gradientView.setGradient(for: .cgv)
    }
    
    // MARK: - Configure
    
    func configure(action: Selector, target: Any) {
        buttons.forEach { button in
            button.addTarget(target, action: action, for: .touchUpInside)
        }
    }

    private func updateButtonStyles() {
        for (index, button) in buttons.enumerated() {
            button.isSelected = index == selectedIndex
        }
    }
    
    @objc private func buttonDidTap(_ sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else { return }
        selectedIndex = index
    }
}
