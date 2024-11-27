//
//  UnderlineSegmentedControl.swift
//  CGV
//
//  Created by 최안용 on 11/19/24.
//

import UIKit

import Then

class UnderlineSegmentedControl: UISegmentedControl {
    
    // MARK: - UIComponent
    
    private lazy var underlineView = UIView()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        setStyle()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let segmentWidth = self.bounds.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineYPosition = self.bounds.height - underlineHeight
                
        underlineView.frame = CGRect(
            x: segmentWidth * CGFloat(self.selectedSegmentIndex),
            y: underlineYPosition,
            width: segmentWidth,
            height: underlineHeight
        )
    }
    
    // MARK: - UISetting
    
    private func setStyle() {
        underlineView.do {
            $0.backgroundColor = .cgvR400
        }
        
        self.do {
            let image = UIImage()
            $0.setBackgroundImage(image, for: .normal, barMetrics: .default)
            $0.setBackgroundImage(image, for: .selected, barMetrics: .default)
            $0.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
            
            $0.setDividerImage(
                image,
                forLeftSegmentState: .normal,
                rightSegmentState: .normal,
                barMetrics: .default
            )
            
            $0.layer.cornerRadius = 0
            $0.clipsToBounds = false
        }
    }
    
    private func setUI() {
        addSubview(underlineView)
    }
}
