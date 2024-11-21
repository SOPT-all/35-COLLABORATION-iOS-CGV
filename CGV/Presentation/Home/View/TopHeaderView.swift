//
//  TopHeaderView.swift
//  CGV
//
//  Created by 김송희 on 11/20/24.
//

import UIKit

class TopHeaderView: BaseView {
    
    private let ticketButton = UIButton()
    private let cgvLogo = UIImageView()
    private let searchButton = UIButton()
    private let menuButton = UIButton()
    
    override func setStyle() {
        ticketButton.do {
            $0.setImage(UIImage(resource: .icHomeTicket), for: .normal)
            $0.backgroundColor = .clear
        }
        
        cgvLogo.do {
            $0.image = UIImage(resource: .imgHomeLogo)
        }
        
        searchButton.do {
            $0.setImage(UIImage(resource: .icHomeSearch), for: .normal)
        }
        
        menuButton.do {
            $0.setImage(UIImage(resource: .icHomeMenu), for: .normal)
            $0.backgroundColor = .clear
        }
    }
    
    override func setUI() {
        self.addSubviews(ticketButton, cgvLogo, searchButton, menuButton)
    }
    
    override func setLayout() {
        ticketButton.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
            $0.size.equalTo(30)
        }
        
        cgvLogo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.height.equalTo(33)
            $0.width.equalTo(71)
        }
        
        searchButton.snp.makeConstraints{
            $0.trailing.equalTo(menuButton.snp.leading)
            $0.size.equalTo(30)
        }
        
        menuButton.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.size.equalTo(30)
        }
    }
}
