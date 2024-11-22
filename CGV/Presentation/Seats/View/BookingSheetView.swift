//
//  BookingSheetView.swift
//  CGV
//
//  Created by 예삐 on 11/22/24.
//

import UIKit

import SnapKit
import Then

final class BookingSheetView: BaseView {
    
    // MARK: - UIComponent
    
    private let titleLabel = UILabel()
    
    private let dateLabel = UILabel()
    
    private let theaterLabel = UILabel()
    
    private let timeLabel = UILabel()
    
    private let infoStackView = UIStackView()
    
    private let dateStackView = UIStackView()
    
    private let theaterStackView = UIStackView()
    
    private let timeStackView = UIStackView()
    
    // MARK: - UISetting
    
    override func setStyle() {
        titleLabel.do {
            $0.setText("글래디에이터 2", style: Kopub.head7, color: .cgvBlack, isSingleLine: true)
        }
        
        dateLabel.do {
            $0.setText("2024.11.9 (토)", style: Kopub.head4, color: .cgvG700, isSingleLine: true)
        }
        
        theaterLabel.do {
            $0.setText("구리", style: Kopub.head4, color: .cgvG700, isSingleLine: true)
        }
        
        timeLabel.do {
            $0.setText("10:40 ~ 12:39", style: Kopub.head4, color: .cgvG700, isSingleLine: true)
        }
        
        infoStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .fill
            $0.distribution = .fill
        }
        
        dateStackView.do {
            $0.axis = .horizontal
            $0.backgroundColor = .cgvG100
            $0.layer.cornerRadius = 8
            $0.alignment = .fill
            $0.distribution = .fill
            $0.isLayoutMarginsRelativeArrangement = true
            $0.layoutMargins = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)
        }
        
        theaterStackView.do {
            $0.axis = .horizontal
            $0.backgroundColor = .cgvG100
            $0.layer.cornerRadius = 8
            $0.alignment = .fill
            $0.distribution = .fill
            $0.isLayoutMarginsRelativeArrangement = true
            $0.layoutMargins = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)
        }
        
        timeStackView.do {
            $0.axis = .horizontal
            $0.backgroundColor = .cgvG100
            $0.layer.cornerRadius = 8
            $0.alignment = .fill
            $0.distribution = .fill
            $0.isLayoutMarginsRelativeArrangement = true
            $0.layoutMargins = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)
        }
    }
    
    override func setUI() {
        addSubviews(titleLabel, infoStackView)
        infoStackView.addArrangedSubviews(dateStackView, theaterStackView, timeStackView)
        dateStackView.addArrangedSubview(dateLabel)
        theaterStackView.addArrangedSubview(theaterLabel)
        timeStackView.addArrangedSubview(timeLabel)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
    }
}
