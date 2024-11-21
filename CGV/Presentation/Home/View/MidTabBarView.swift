//
//  MidTabBarView.swift
//  CGV
//
//  Created by 김송희 on 11/21/24.
//

import UIKit

import SnapKit
import Then

class MidTabBarView: UICollectionReusableView {
    
    static let identifier = "TabBarKind"
    
    private var tabs: [String] = []
    private var selectedIndex: Int = 0 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var didSelectTab: ((Int) -> Void)?
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 8
        }
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        collectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(
                MidTabBarCell.self,
                forCellWithReuseIdentifier: MidTabBarCell.reuseIdentifier
            )
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
    }
    
    private func setUI() {
        addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(tabs: [String], selectedIndex: Int = 0) {
        self.tabs = tabs
        self.selectedIndex = selectedIndex
        collectionView.reloadData()
    }
}

extension MidTabBarView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return tabs.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MidTabBarCell.reuseIdentifier,
            for: indexPath
        ) as? MidTabBarCell else { return UICollectionViewCell() }
        cell.configure(title: tabs[indexPath.row], isSelected: indexPath.row == selectedIndex)
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedIndex = indexPath.row
        didSelectTab?(selectedIndex)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let title = tabs[indexPath.row]
        let font = UIFont.setupFont(of: Kopub.body3)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let width = title.size(withAttributes: attributes).width + 14
        return CGSize(width: ceil(width), height: 26)
    }

}


