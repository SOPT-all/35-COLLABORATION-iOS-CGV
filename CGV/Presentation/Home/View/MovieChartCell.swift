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
    
    override func setStyle() {
        posterImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        firstStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 2
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
            $0.spacing = 6
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
        }
    }
    
    override func setUI() {
        self.addSubviews(posterImageView, firstStackView, secondStackView, reserveButton)
        
        firstStackView.addArrangedSubviews(titleLabel, ageLimitImageView)
        secondStackView.addArrangedSubviews(preEggLogoImageView, preEggStatLabel, divider, dDayLabel)
    }
    
    override func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(230)
        }
        
        firstStackView.snp.makeConstraints{
            $0.top.equalTo(posterImageView.snp.bottom).offset(8)
            $0.centerX.equalTo(posterImageView.snp.centerX)
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(119)
        }
        
        ageLimitImageView.snp.makeConstraints{
            $0.size.equalTo(22)
        }
        
        secondStackView.snp.makeConstraints{
            $0.top.equalTo(firstStackView.snp.bottom)
            $0.centerX.equalTo(posterImageView.snp.centerX)
        }
        
        preEggLogoImageView.snp.makeConstraints{
            $0.size.equalTo(18)
        }
        
        divider.snp.makeConstraints{
            $0.width.equalTo(1)
            $0.height.equalTo(6)
        }
        
        reserveButton.snp.makeConstraints{
            $0.top.equalTo(secondStackView.snp.bottom).offset(10)
            $0.centerX.equalTo(posterImageView.snp.centerX)
            $0.width.equalTo(160)
            $0.height.equalTo(40)
        }
    }
    
    func configure(
        poster: UIImage?,
        title: String,
        ageLimit: UIImage?,
        preEgg: String,
        dDay: String
    ) {
        posterImageView.image = poster
        titleLabel.setText(title, style: Kopub.head4, color: .cgvBlack, isSingleLine: true)
        ageLimitImageView.image = ageLimit
        preEggStatLabel.setText(preEgg, style: Kopub.head3, color: .cgvG800)
        dDayLabel.setText(dDay, style: Kopub.head3, color: .cgvR400)
    }
}
