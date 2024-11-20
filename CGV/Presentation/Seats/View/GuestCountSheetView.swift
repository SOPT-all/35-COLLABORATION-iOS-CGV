//
//  GuestCountSheetView.swift
//  CGV
//
//  Created by 예삐 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class GuestCountSheetView: BaseView {
    
    private let titleLabel = UILabel()
    
    private let dateLabel = UILabel()
    
    private let theaterLabel = UILabel()
    
    private let timeLabel = UILabel()
    
    private let infoStackView = UIStackView()
    
    private let dateStackView = UIStackView()
    
    private let theaterStackView = UIStackView()
    
    private let timeStackView = UIStackView()
    
    private let guestCountLabel = UILabel()
    
    private let maxCountLabel = UILabel()
    
    private let generalLabel = UILabel()
    
    private let youthLabel = UILabel()
    
    private let seniorLabel = UILabel()
    
    private let discountLabel = UILabel()
    
    let generalButton = GuestCountButton(count: 0)
    
    let youthButton = GuestCountButton(count: 0)
    
    let seniorButton = GuestCountButton(count: 0)
    
    let discountButton = GuestCountButton(count: 0)
    
    let backButton = UIButton()
    
    let selectButton = UIButton()
    
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
        
        guestCountLabel.do {
            $0.setText("인원선택", style: Kopub.head4, color: .cgvBlack, isSingleLine: true)
        }
        
        maxCountLabel.do {
            $0.setText("*최대 8명", style: Kopub.body1, color: .cgvG500, isSingleLine: true)
        }
        
        generalLabel.do {
            $0.setText("일반", style: Kopub.body5, color: .cgvBlack, isSingleLine: true)
        }
        
        youthLabel.do {
            $0.setText("청소년", style: Kopub.body5, color: .cgvBlack, isSingleLine: true)
        }
        
        seniorLabel.do {
            $0.setText("경로", style: Kopub.body5, color: .cgvBlack, isSingleLine: true)
        }
        
        discountLabel.do {
            $0.setText("우대", style: Kopub.body5, color: .cgvBlack, isSingleLine: true)
        }
        
        backButton.do {
            $0.setTitle("뒤로가기", style: Kopub.head7, color: .cgvR400)
            $0.setLayer(borderWidth: 1, borderColor: .cgvR400, cornerRadius: 12)
        }
        
        selectButton.do {
            $0.setTitle("좌석선택", style: Kopub.head7, color: .cgvWhite)
            $0.backgroundColor = .cgvG500
            $0.layer.cornerRadius = 12
            $0.isEnabled = false
        }
    }
    
    override func setUI() {
        addSubviews(
            titleLabel,
            infoStackView,
            guestCountLabel,
            maxCountLabel,
            generalLabel,
            youthLabel,
            seniorLabel,
            discountLabel,
            generalButton,
            youthButton,
            seniorButton,
            discountButton,
            backButton,
            selectButton
        )
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
        
        guestCountLabel.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(20)
        }
        
        maxCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(guestCountLabel.snp.centerY).offset(2)
            $0.leading.equalTo(guestCountLabel.snp.trailing).offset(8)
        }
        
        generalLabel.snp.makeConstraints {
            $0.top.equalTo(guestCountLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(20)
        }
        
        youthLabel.snp.makeConstraints {
            $0.top.equalTo(generalLabel.snp.bottom).offset(26)
            $0.leading.equalToSuperview().inset(20)
        }
        
        seniorLabel.snp.makeConstraints {
            $0.top.equalTo(youthLabel.snp.bottom).offset(26)
            $0.leading.equalToSuperview().inset(20)
        }
        
        discountLabel.snp.makeConstraints {
            $0.top.equalTo(seniorLabel.snp.bottom).offset(26)
            $0.leading.equalToSuperview().inset(20)
        }
        
        generalButton.snp.makeConstraints {
            $0.centerY.equalTo(generalLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(GuestCountButton.defaultWidth)
            $0.height.equalTo(GuestCountButton.defaultHeight)
        }
        
        youthButton.snp.makeConstraints {
            $0.centerY.equalTo(youthLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(GuestCountButton.defaultWidth)
            $0.height.equalTo(GuestCountButton.defaultHeight)
        }
        
        seniorButton.snp.makeConstraints {
            $0.centerY.equalTo(seniorLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(GuestCountButton.defaultWidth)
            $0.height.equalTo(GuestCountButton.defaultHeight)
        }
        
        discountButton.snp.makeConstraints {
            $0.centerY.equalTo(discountLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(GuestCountButton.defaultWidth)
            $0.height.equalTo(GuestCountButton.defaultHeight)
        }
        
        backButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(36)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset((UIScreen.main.bounds.width / 2) + 10)
            $0.height.equalTo(60)
        }
        
        selectButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(36)
            $0.leading.equalToSuperview().inset((UIScreen.main.bounds.width / 2) + 10)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
}
