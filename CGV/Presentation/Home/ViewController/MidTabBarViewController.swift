//
//  MidTabBarViewController.swift
//  CGV
//
//  Created by 김송희 on 11/26/24.
//

import UIKit

class MidTabBarViewController: BaseViewController {
    
    // MARK: - Property
    
    private let midTabBarView = MidTabBarView()
    private var tabs: [String] = []
    private var selectedIndex: Int = 0 {
        didSet {
            midTabBarView.collectionView.reloadData()
        }
    }
    var onTabSelected: ((Int) -> Void)?
    
    // MARK: - LifeCycle
    
    override func loadView() {
        self.view = midTabBarView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Set CollectionView
    
    private func setupCollectionView() {
        midTabBarView.collectionView.delegate = self
        midTabBarView.collectionView.dataSource = self
        midTabBarView.collectionView.register(
            MidTabBarCell.self,
            forCellWithReuseIdentifier: MidTabBarCell.reuseIdentifier
        )
    }
    
    // MARK: - Configuration
    
    func configure(tabs: [String], selectedIndex: Int = 0) {
        self.tabs = tabs
        self.selectedIndex = selectedIndex
        midTabBarView.updateTabs()
    }
}

// MARK: - UICollectionViewDataSource

extension MidTabBarViewController: UICollectionViewDataSource {
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
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MidTabBarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedIndex = indexPath.row
        onTabSelected?(selectedIndex)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let title = tabs[indexPath.row]
        let font = UIFont.setupFont(of: Kopub.body3)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let width = Screen.width(title.size(withAttributes: attributes).width + 19)
        return CGSize(width: ceil(width), height: Screen.height(26))
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
