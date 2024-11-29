//
//  MovieChartCell.swift
//  CGV
//
//  Created by 김송희 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class MovieChartCell: BaseCollectionViewCell {
    
    // MARK: - Property
    
    var didTapReserveButton: (() ->  Void)?
    
    private let posterImageView = UIImageView()
    
    private let firstStackView = UIStackView()
    private let titleLabel = UILabel()
    private let ageLimitImageView = UIImageView()
    
    private let secondStackView = UIStackView()
    private let preEggLogoImageView = UIImageView()
    private let preEggStatLabel = UILabel()
    private let divider = UILabel()
    private let dDayLabel = UILabel()
    
    private let reserveButton = UIButton()
    
    @objc
    private func reserveButtonDidTap() {
        didTapReserveButton?()
    }
    
    // MARK: - UISetting
    
    override func setStyle() {
        posterImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        firstStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = Screen.width(2)
            $0.distribution = .equalSpacing
        }
        
        titleLabel.do {
            $0.setText(style: Kopub.head4, color: .black, isSingleLine: true)
        }
        
        ageLimitImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        secondStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = Screen.width(6)
            $0.distribution = .equalSpacing
        }
        
        preEggLogoImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(resource: .icHomeEgg)
        }
        
        preEggStatLabel.do {
            $0.setText(style: Kopub.head3, color: .cgvG800)
        }
        
        divider.do {
            $0.backgroundColor = UIColor(resource: .cgvG200)
        }
        
        dDayLabel.do {
            $0.setText(style: Kopub.head3, color: .cgvR400)
        }
        
        reserveButton.do {
            $0.setTitle("지금예매", style: Kopub.head4, color: .white)
            $0.backgroundColor = UIColor(resource: .cgvR400)
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
            $0.addTarget(self, action: #selector(reserveButtonDidTap), for: .touchUpInside)
        }
    }
    
    override func setUI() {
        addSubviews(
            posterImageView,
            firstStackView,
            secondStackView,
            reserveButton
        )
        
        firstStackView.addArrangedSubviews(
            titleLabel,
            ageLimitImageView
        )
        secondStackView.addArrangedSubviews(
            preEggLogoImageView,
            preEggStatLabel,
            divider,
            dDayLabel
        )
    }
    
    override func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(Screen.width(160))
            $0.height.equalTo(Screen.height(230))
        }
        
        firstStackView.snp.makeConstraints{
            $0.top.equalTo(posterImageView.snp.bottom).offset(Screen.height(8))
            $0.centerX.equalTo(posterImageView.snp.centerX)
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(Screen.width(119))
        }
        
        ageLimitImageView.snp.makeConstraints{
            $0.width.equalTo(Screen.width(22))
            $0.height.equalTo(Screen.height(22))
        }
        
        secondStackView.snp.makeConstraints{
            $0.top.equalTo(firstStackView.snp.bottom)
            $0.centerX.equalTo(posterImageView.snp.centerX)
        }
        
        preEggLogoImageView.snp.makeConstraints{
            $0.width.equalTo(Screen.width(18))
            $0.height.equalTo(Screen.height(18))
        }
        
        divider.snp.makeConstraints{
            $0.width.equalTo(Screen.width(1))
            $0.height.equalTo(Screen.height(6))
        }
        
        reserveButton.snp.makeConstraints{
            $0.top.equalTo(secondStackView.snp.bottom).offset(Screen.height(10))
            $0.centerX.equalTo(posterImageView.snp.centerX)
            $0.width.equalTo(Screen.width(160))
            $0.height.equalTo(Screen.height(40))
        }
    }
    
    // MARK: - Configure
    
    func configure(
        poster: UIImage?,
        title: String,
        ageLimit: UIImage?,
        preEgg: String,
        dDay: String
    ) {
        posterImageView.image = poster
        titleLabel.updateText(title)
        ageLimitImageView.image = ageLimit
        preEggStatLabel.updateText(preEgg)
        dDayLabel.updateText(dDay)
    }
}
