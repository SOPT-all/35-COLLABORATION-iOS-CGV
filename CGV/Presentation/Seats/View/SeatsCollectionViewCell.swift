//
//  SeatsCollectionViewCell.swift
//  CGV
//
//  Created by 예삐 on 11/21/24.
//

import UIKit

import SnapKit
import Then

final class SeatsCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Property
    
    private let timeView = UIView()
    
    private let seatsView = UIView()

    private let timeStackView = UIStackView()
    
    private let seatsStackView = UIStackView()
    
    private let startTimeLabel = UILabel()
    
    private let endTimeLabel = UILabel()
    
    private let morningIcon = UIImageView()
    
    private let remainSeatsLabel = UILabel()
    
    // MARK: - UISetting
    
    override func setStyle() {
        layer.cornerRadius = 6
        layer.masksToBounds = true
        
        timeView.do {
            $0.backgroundColor = .cgvWhite
        }

        seatsView.do {
            $0.backgroundColor = .cgvG100
        }
        
        timeStackView.do {
            $0.axis = .horizontal
            $0.spacing = 0
            $0.alignment = .fill
            $0.distribution = .fill
        }
        
        seatsStackView.do {
            $0.axis = .horizontal
            $0.spacing = 0
            $0.alignment = .bottom
            $0.distribution = .fill
        }
        
        startTimeLabel.do {
            $0.setText(style: Malgun.head2, color: .cgvBlack, isSingleLine: true)
        }
        
        endTimeLabel.do {
            $0.setText(style: Malgun.body1, color: .cgvG600, isSingleLine: true)
        }
        
        morningIcon.do {
            $0.image = .icTimeSun
        }
        
        remainSeatsLabel.do {
            $0.setText("183/185석", style: Malgun.body3, color: .cgvBlack)
        }
    }
    
    override func setUI() {
        addSubviews(timeView, seatsView, timeStackView, seatsStackView)
        timeStackView.addArrangedSubviews(startTimeLabel, endTimeLabel)
        seatsStackView.addArrangedSubviews(morningIcon, remainSeatsLabel)
    }
    
    override func setLayout() {
        timeView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(seatsView.snp.top)
        }
        
        seatsView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        timeStackView.snp.makeConstraints {
            $0.centerY.equalTo(timeView.snp.centerY)
            $0.centerX.equalTo(timeView.snp.centerX)
        }
        
        seatsStackView.snp.makeConstraints {
            $0.centerY.equalTo(seatsView.snp.centerY)
            $0.centerX.equalTo(seatsView.snp.centerX)
        }
        
        remainSeatsLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(-6)
        }
    }
}

extension SeatsCollectionViewCell {
    func dataBind(_ mockData: SeatsTimeModel) {
        startTimeLabel.updateText(mockData.startTime)
        endTimeLabel.updateText(mockData.endTime)
        morningIcon.isHidden = !mockData.isMorning
    }
}
