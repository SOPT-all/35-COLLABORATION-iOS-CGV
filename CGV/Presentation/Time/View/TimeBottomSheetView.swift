//
//  TimeBottomSheetView.swift
//  CGV
//
//  Created by 최안용 on 11/18/24.
//

import UIKit

import SnapKit

final class TimeBottomSheetView: BaseView {
    
    // MARK: - Property
    
    private let segmentControl = UnderlineSegmentedControl(items: ["지역별", "특별관"])
    private let buttonStackView = UIStackView()
    private let recentStackView = UIStackView()
    private let surroundingStackView = UIStackView()
    private let noticeLabel = UILabel()
    private let recentLabel = UILabel()
    private let surroundingLabel = UILabel()
    private let emptyView = UIView()
    private let gradientView = UIView()
    private let seperatorView = UIView()
    private var regionsCategoryButton: [UIButton] = []
    private var regionInfos = RegionInfo.initTheaters()
    
    let selectedTheaterStackView = UIStackView()
    let selectButton = UIButton(type: .system)
    
    var theatersButtons: [TheaterButton] = []
        
    // MARK: - LifeCycle
    
    override func setStyle() {
        segmentControl.do {
            $0.selectedSegmentIndex = 0
            $0.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor.cgvG850,
                NSAttributedString.Key.font: UIFont.kopub(.body4)
            ], for: .normal)
            $0.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor.cgvR400,
                NSAttributedString.Key.font: UIFont.kopub(.body4)
            ], for: .selected)
        }
        
        buttonStackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 0
        }
        
        emptyView.do {
            $0.backgroundColor = UIColor(hexCode: "FBFBFB")
        }
        
        seperatorView.do {
            $0.backgroundColor = .cgvG200
        }
        
        for regionInfo in regionInfos {
            let button = UIButton(type: .system)
            let regionTitle = regionInfo.region.title
            
            let attributedTitle = NSMutableAttributedString(
                string: regionTitle,
                attributes: [
                    .font: UIFont.kopub(.body4),
                    .foregroundColor: UIColor.cgvG700
                ]
            )
            
            let countAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.kopub(.body2),
                .foregroundColor: UIColor.cgvG700
            ]
            
            if let regionCount = regionInfo.region.count {
                attributedTitle.append(NSAttributedString(
                    string: ("(\(regionCount))"),
                    attributes: countAttributes)
                )
            }
            
            button.setAttributedTitle(attributedTitle, for: .normal)
            
            let selectedattributedTitle = NSMutableAttributedString(
                string: regionTitle,
                attributes: [
                    .font: UIFont.kopub(.head4),
                    .foregroundColor: UIColor.cgvBlack
                ]
            )
            
            button.setAttributedTitle(selectedattributedTitle, for: .selected)
            button.contentHorizontalAlignment = .left
            button.backgroundColor = UIColor(hexCode: "FBFBFB")
            
            
            var config = UIButton.Configuration.plain()
            config.contentInsets = .init(top: 11, leading: 30, bottom: 11, trailing: 0)
            button.configuration = config
            button.configuration?.baseBackgroundColor = .clear
            button.isEnabled = false
            
            if regionInfo.region == .suggestion {
                button.backgroundColor = .cgvWhite
                button.setAttributedTitle(selectedattributedTitle, for: .disabled)
                button.backgroundColor = .cgvWhite
            }
            
            regionsCategoryButton.append(button)
        }
        
        for theater in regionInfos[0].theaters {
            let button = TheaterButton(theater: theater)
            theatersButtons.append(button)
        }
        
        noticeLabel.do {
            $0.setText("CGV를 선택해주세요\n최대 5개까지 선택 가능합니다.",
                       style: Kopub.body2,
                       color: .cgvG600)
        }
        
        recentLabel.do {
            $0.setText("최근 이용한 CGV",
                       style: Kopub.head1,
                       color: .cgvR400,
                       isSingleLine: true)
        }
        
        surroundingLabel.do {
            $0.setText("현재 주변에 있는 CGV",
                       style: Kopub.head1,
                       color: .cgvR400,
                       isSingleLine: true)
        }
        
        recentStackView.do {
            $0.axis = .vertical
            $0.spacing = 0
            $0.distribution = .fillEqually
        }
        
        surroundingStackView.do {
            $0.axis = .vertical
            $0.spacing = 0
            $0.distribution = .fillEqually
        }
        
        gradientView.do {
            $0.backgroundColor = .cgvWhite
            $0.layer.borderColor = UIColor.cgvG100.cgColor
            $0.layer.shadowOffset = CGSize(width: 0, height: -10)
            $0.layer.shadowRadius = 4
            $0.layer.shadowOpacity = 0.1
        }
        
        selectedTheaterStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .fill
            $0.distribution = .equalSpacing
        }
        
        selectButton.do {
            $0.backgroundColor = .cgvG500
            $0.setTitle("극장 선택", style: Kopub.head7, color: .cgvWhite)
            $0.layer.cornerRadius = 12
            $0.isEnabled = false
        }
    }
    
    override func setUI() {
        regionsCategoryButton.forEach { button in
            buttonStackView.addArrangedSubview(button)
        }
        
        recentStackView.addArrangedSubviews(theatersButtons[0], theatersButtons[1])
        
        surroundingStackView.addArrangedSubview(theatersButtons[2])
        
        addSubviews(
            segmentControl,
            buttonStackView,
            emptyView,
            noticeLabel,
            recentLabel,
            recentStackView,
            surroundingLabel,
            surroundingStackView,
            seperatorView,
            gradientView,
            selectedTheaterStackView,
            selectButton
        )
    }
    
    override func setLayout() {
        segmentControl.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(9)
            $0.height.equalTo(42)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(segmentControl.snp.bottom).offset(13)
            $0.trailing.equalTo(segmentControl.snp.centerX).offset(-28)
        }
        
        emptyView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(buttonStackView.snp.horizontalEdges)
            $0.top.equalTo(buttonStackView.snp.bottom)
            $0.height.greaterThanOrEqualTo(26)
            $0.bottom.equalTo(gradientView.snp.top)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.leading.equalTo(buttonStackView.snp.trailing).offset(24)
            $0.top.equalTo(segmentControl.snp.bottom).offset(19)
        }
        
        recentLabel.snp.makeConstraints {
            $0.leading.equalTo(noticeLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(noticeLabel.snp.bottom).offset(16)
        }
        
        recentStackView.snp.makeConstraints {
            $0.leading.equalTo(noticeLabel.snp.leading)
            $0.top.equalTo(recentLabel.snp.bottom).offset(16)
            $0.trailing.equalTo(recentLabel.snp.trailing)
            $0.width.equalTo(TheaterButton.defaultWidth)
        }
        
        seperatorView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(recentStackView.snp.horizontalEdges)
            $0.bottom.equalTo(recentStackView.snp.bottom)
            $0.height.equalTo(1)
        }
        
        surroundingLabel.snp.makeConstraints {
            $0.top.equalTo(recentStackView.snp.bottom).offset(25.93)
            $0.leading.equalTo(noticeLabel.snp.leading)
        }
        
        surroundingStackView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(seperatorView.snp.horizontalEdges)
            $0.top.equalTo(surroundingLabel.snp.bottom).offset(16)
        }
        
        gradientView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(156)
        }
        
        selectedTheaterStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(26)
            $0.top.equalTo(gradientView.snp.top).offset(9)
            $0.height.equalTo(TheaterChipButton.defaultHeight)
        }
        
        selectButton.snp.makeConstraints {
            $0.top.equalTo(gradientView.snp.top).offset(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
}

// MARK: - Function

extension TimeBottomSheetView {
    func makeTheaterChipButton(theater: String) {
        let button = TheaterChipButton(title: theater)
        selectedTheaterStackView.addArrangedSubview(button)
    }
    
    func deleteTheaterChipButton(theater: String) {
        for subview in selectedTheaterStackView.arrangedSubviews {
            if let button = subview as? TheaterChipButton,
               let title = button.theaterNameLabel.text,
               title == theater {
                selectedTheaterStackView.removeArrangedSubview(button)
                button.removeFromSuperview()
                break
            }
        }
    }
}
