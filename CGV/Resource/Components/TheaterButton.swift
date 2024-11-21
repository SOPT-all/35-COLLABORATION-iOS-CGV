//
//  TheaterButton.swift
//  CGV
//
//  Created by 최안용 on 11/20/24.
//

import UIKit

import SnapKit
import Then

final class TheaterButton: UIButton {
    static let defaultWidth: CGFloat = 171
    static let defaultHeight: CGFloat = 44

    private let theaterNameLabel = UILabel()
    private let clickImageView = UIImageView()
    
    var theater: TheaterInfo?
    
    override var isSelected: Bool {
        didSet {
            setStyle()
        }
    }
    
    init(theater: TheaterInfo) {
        super.init(frame: .zero)
        
        self.theater = theater
        setTheaterNameLabel(title: theater.theaterName)
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
        backgroundColor = isSelected ? .cgvG300 : .cgvWhite
        
        clickImageView.do {
            $0.image = .icTimeModalCheck
            $0.contentMode = .scaleAspectFit
            $0.isHidden = isSelected ? false : true
        }
    }
    
    private func setUI() {
        addSubviews(theaterNameLabel, clickImageView)
    }
    
    private func setLayout() {
        theaterNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.verticalEdges.equalToSuperview().inset(10)
        }
        
        clickImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.verticalEdges.equalToSuperview().inset(12)
        }
    }
    
    private func setTheaterNameLabel(title: String) {
        theaterNameLabel.setText(title, style: Kopub.head4, color: .cgvG850, isSingleLine: true)
    }
}
