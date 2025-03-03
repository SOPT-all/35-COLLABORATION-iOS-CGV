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
    
    private let guestCountLabel = UILabel()
    
    private let priceStackView = UIStackView()
    
    private let priceLabel = UILabel()
    
    private let priceUnitLabel = UILabel()
    
    let editCountButton = UIButton()
    
    let bookingButton = UIButton()
    
    // MARK: - UISetting
    
    override func setStyle() {
        titleLabel.do {
            $0.setText("글래디에이터 2", style: Kopub.head7, color: .cgvBlack, isSingleLine: true)
        }
        
        dateLabel.do {
            $0.setText("2024.11.05 (월)", style: Kopub.head4, color: .cgvG700, isSingleLine: true)
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
            $0.setText("일반1", style: Kopub.body5, color: UIColor.cgvBlack)
        }
        
        editCountButton.do {
            $0.setTitle("인원변경", style: Kopub.body3, color: .cgvG600)
            $0.setLayer(borderWidth: 1, borderColor: .cgvG600, cornerRadius: 8)
        }
        
        priceStackView.do {
            $0.axis = .horizontal
            $0.spacing = 2
            $0.alignment = .fill
            $0.distribution = .fill
        }
        
        priceLabel.do {
            $0.setText("14,000", style: Kopub.head8, color: UIColor.cgvBlack)
        }
        
        priceUnitLabel.do {
            $0.setText("원", style: Kopub.head5, color: UIColor.cgvBlack, isSingleLine: true)
        }
        
        bookingButton.do {
            $0.setTitle("예매하기", style: Kopub.head7, color: .cgvWhite)
            $0.backgroundColor = .cgvR400
            $0.layer.cornerRadius = 12
        }
    }
    
    override func setUI() {
        addSubviews(
            titleLabel,
            infoStackView,
            guestCountLabel,
            editCountButton,
            priceStackView,
            bookingButton
        )
        infoStackView.addArrangedSubviews(dateStackView, theaterStackView, timeStackView)
        dateStackView.addArrangedSubview(dateLabel)
        theaterStackView.addArrangedSubview(theaterLabel)
        timeStackView.addArrangedSubview(timeLabel)
        priceStackView.addArrangedSubviews(priceLabel, priceUnitLabel)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Screen.height(40))
            $0.centerX.equalToSuperview()
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Screen.height(16))
            $0.centerX.equalToSuperview()
        }
        
        guestCountLabel.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.bottom).offset(Screen.height(20))
            $0.leading.equalToSuperview().inset(Screen.width(20))
        }
        
        editCountButton.snp.makeConstraints {
            $0.centerY.equalTo(guestCountLabel.snp.centerY).offset(Screen.height(2))
            $0.leading.equalTo(guestCountLabel.snp.trailing).offset(Screen.width(8))
            $0.width.equalTo(Screen.width(66))
            $0.height.equalTo(Screen.height(26))
        }
        
        priceStackView.snp.makeConstraints {
            $0.centerY.equalTo(guestCountLabel.snp.centerY).offset(Screen.height(2))
            $0.trailing.equalToSuperview().inset(Screen.width(20))
        }
        
        bookingButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(Screen.height(36))
            $0.leading.trailing.equalToSuperview().inset(Screen.width(20))
            $0.height.equalTo(Screen.height(60))
        }
    }
    
    func movieName() -> String {
        return titleLabel.text ?? ""
    }
    
    func theaterName() -> String {
        return theaterLabel.text ?? ""
    }
    
    func startTime() -> String {
        guard let formatedDate = formatDate(from: dateLabel.text),
              let start = extractTimeRange(from: timeLabel.text)?.start else {
            return ""
        }
        return "\(formatedDate)T\(start)"
    }
    
    func endTime() -> String {
        guard let formatedDate = formatDate(from: dateLabel.text),
              let end = extractTimeRange(from: timeLabel.text)?.end else {
            return ""
        }
        return "\(formatedDate)T\(end)"
    }
    
    private func formatDate(from text: String?) -> String? {
        // "2024.11.05 (월)" -> "2024-11-05"
        guard let text = text else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd (E)"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        if let date = dateFormatter.date(from: text) {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: date)
        }
        return nil
    }

    private func extractTimeRange(from text: String?) -> (start: String, end: String)? {
        // "10:40 ~ 12:39" -> ("10:40", "12:39")
        guard let text = text else { return nil }
        let times = text.split(separator: "~").map { $0.trimmingCharacters(in: .whitespaces) }
        guard times.count == 2 else { return nil }
        return (start: times[0], end: times[1])
    }
    
}
