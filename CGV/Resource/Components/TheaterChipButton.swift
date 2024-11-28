//
//  TheaterChipButton.swift
//  CGV
//
//  Created by 최안용 on 11/20/24.
//

import UIKit

import SnapKit
import Then

class TheaterChipButton: UIButton {
    static let defaultHeight: CGFloat = Screen.height(36)

    let theaterNameLabel = UILabel()
    private let closeImageView = UIImageView()
    private let stackView = UIStackView()
    
    init(title: String) {
        super.init(frame: .zero)
        
        setTheaterNameLabel(title: title)
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
    
    private func setStyle() {
        closeImageView.do {
            $0.image = .icXBlack
            $0.contentMode = .scaleAspectFit            
        }
        
        stackView.do {
            $0.axis = .horizontal
            $0.spacing = Screen.width(4)
            $0.backgroundColor = .cgvG300
            $0.layer.cornerRadius = 8
            $0.alignment = .center
            $0.distribution = .fill
            $0.isLayoutMarginsRelativeArrangement = true
            $0.layoutMargins = UIEdgeInsets(
                top: Screen.height(6),
                left: Screen.width(12),
                bottom: Screen.height(6),
                right: Screen.width(6)
            )
        }
    }
    
    private func setUI() {
        stackView.addArrangedSubviews(theaterNameLabel, closeImageView)
        
        addSubview(stackView)
    }
    
    private func setLayout() {
        closeImageView.snp.makeConstraints {
            $0.size.equalTo(Screen.width(16))
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setTheaterNameLabel(title: String) {
        theaterNameLabel.setText(title, style: Kopub.head4, color: .cgvG850, isSingleLine: true)
    }
}
