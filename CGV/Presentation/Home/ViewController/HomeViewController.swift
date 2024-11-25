//
//  HomeViewController.swift
//  CGV
//
//  Created by 예삐 on 11/17/24.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Property
    
    private let homeView = HomeView()
    private var currentSpecialPage: Int = 0
    private var currentTodayCGVPage: Int = 0
    
    private var dataSource: UICollectionViewDiffableDataSource<HomeSectionType, HomeItem>!
    
    // MARK: - LifeCycle
    
    override func loadView() {
        let rootView = UIView()
        rootView.addSubview(homeView)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.collectionView.collectionViewLayout = createLayout()
        homeView.setRegister()
        configureDataSource()
        applyInitialSnapshots()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setLayout() {
        homeView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController {
    
    // MARK: - DataSource
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<HomeSectionType, HomeItem>(
            collectionView: homeView.collectionView
        ) {
            collectionView,
            indexPath,
            item in
            
            switch item.section {
            case .topHeader:
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: TopHeaderViewCell.reuseIdentifier,
                    for: indexPath
                ) as? TopHeaderViewCell {
                    return cell
                } else {
                    return UICollectionViewCell()
                }
                
            case .topTabBar:
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: TopTabBarCell.reuseIdentifier,
                    for: indexPath
                ) as? TopTabBarCell {
                    cell.configure(action: #selector(self.topTabBarChanged(_:)), target: self)
                    return cell
                } else {
                    return UICollectionViewCell()
                }
                
            case .banner:
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: BannerImageCell.reuseIdentifier,
                    for: indexPath
                ) as? BannerImageCell {
                    cell.configure(image: item.image)
                    return cell
                } else {
                    return UICollectionViewCell()
                }
                
            case .movieChart:
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MovieChartCell.reuseIdentifier,
                    for: indexPath
                ) as? MovieChartCell {
                    cell.configure(
                        poster: item.image,
                        title: item.title,
                        ageLimit: item.ageLimit,
                        preEgg: item.preEgg ?? "",
                        dDay: item.dDay ?? ""
                    )
                    return cell
                } else {
                    return UICollectionViewCell()
                }
                
            case .special, .todayCGV:
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: BigImageCell.reuseIdentifier,
                    for: indexPath
                ) as? BigImageCell {
                    cell.configure(image: item.image)
                    return cell
                } else {
                    return UICollectionViewCell()
                }
                
            case .myCGV:
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MyCGVCell.reuseIdentifier,
                    for: indexPath
                ) as? MyCGVCell {
                    cell.configure(
                        title: item.title,
                        rate: item.rate ?? "",
                        image: item.image
                    )
                    return cell
                } else {
                    return UICollectionViewCell()
                }
                
            case .specialProgress:
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ProgressShareCell.reuseIdentifier,
                    for: indexPath
                ) as? ProgressShareCell {
                    cell.configure(to: self.currentSpecialPage)
                    return cell
                } else {
                    return UICollectionViewCell()
                }
                
            case .todayProgress:
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ProgressShareCell.reuseIdentifier,
                    for: indexPath
                ) as? ProgressShareCell {
                    cell.configure(to: self.currentTodayCGVPage)
                    return cell
                } else {
                    return UICollectionViewCell()
                }
                
            case .specialRate, .todayRate:
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ReserveRateCell.reuseIdentifier,
                    for: indexPath
                ) as? ReserveRateCell {
                    cell.configure(
                        title: item.title,
                        rate: item.rate ?? "",
                        image: item.image
                    )
                    return cell
                } else {
                    return UICollectionViewCell()
                }
                
            case .bottomfooter:
                if let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: BottomFooterCell.reuseIdentifier,
                    for: indexPath
                ) as? BottomFooterCell {
                    cell.configure(
                        title: item.title,
                        image: item.image ?? UIImage()
                    )
                    return cell
                } else {
                    return UICollectionViewCell()
                }
            }
            
        }
        
        dataSource.supplementaryViewProvider = {
            (collectionView: UICollectionView,
             kind: String,
             indexPath: IndexPath) in
            let section = HomeSectionType(rawValue: indexPath.section)
            
            switch kind  {
            case UICollectionView.elementKindSectionHeader:
                if let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: MidHeaderView.reuseIdentifier,
                    for: indexPath
                ) as? MidHeaderView {
                    header.configure(
                        title: section?.headerTitle ?? "",
                        subtitle: section?.headerSubtitle ?? ""
                    )
                    return header
                } else {
                    return UICollectionReusableView()
                }
                
            case "MidTabBar":
                if let tabBar = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: MidTabBarView.reuseIdentifier,
                    for: indexPath
                ) as? MidTabBarView {
                    
                    let tabBarController = MidTabBarViewController()
                    self.addChild(tabBarController)
                    tabBar.addSubview(tabBarController.view)
                    tabBarController.view.frame = tabBar.bounds
                    tabBarController.didMove(toParent: self)
                    
                    if let tabs = section?.midTabBarTitle {
                        tabBarController.configure(tabs: tabs)
                        tabBarController.onTabSelected = { selectedIndex in
                            print("Tab selected: \(selectedIndex) in section \(indexPath.section)")
                        }
                    }
                    return tabBar
                } else {
                    return UICollectionReusableView()
                }
            default:
                return nil
            }
        }
    }
    
    private func applyInitialSnapshots() {
        var snapshot = NSDiffableDataSourceSnapshot<HomeSectionType, HomeItem>()
        
        for section in HomeSectionType.allCases {
            snapshot.appendSections([section])
            
            switch section {
            case .topHeader:
                let topItem = HomeItem(section: .topHeader, title: "")
                snapshot.appendItems([topItem], toSection: .topHeader)
                
            case .topTabBar:
                let segmentedItem = HomeItem(section: .topTabBar, title: "")
                snapshot.appendItems([segmentedItem], toSection: .topTabBar)
                
            default:
                let items = HomeItem.dummyItems.filter { $0.section == section }
                snapshot.appendItems(items, toSection: section)
            }
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension HomeViewController {
    
    // MARK: - Helper Methods
    
    @objc private func topTabBarChanged(_ sender: UISegmentedControl) { }
    
    private func updateSpecialProgress(for index: Int) {
        let indexPath = IndexPath(item: 0, section: HomeSectionType.specialProgress.rawValue)
        if let cell = homeView.collectionView.cellForItem(at: indexPath) as? ProgressShareCell {
            cell.configure(to: index)
        }
    }
    
    private func updateTodayCGVProgress(for index: Int) {
        let indexPath = IndexPath(item: 0, section: HomeSectionType.todayProgress.rawValue)
        if let cell = homeView.collectionView.cellForItem(at: indexPath) as? ProgressShareCell {
            cell.configure(to: index)
        }
    }
}

extension HomeViewController {
    
    // MARK: - Layouts
    
    private func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ in
            guard let sectionType = HomeSectionType(rawValue: sectionIndex) else { return nil }
            
            switch sectionType {
            case .topHeader:
                return self.createTopViewSection()
            case .topTabBar:
                return self.createTopTabBarSection()
            case .banner:
                return self.createBannerSection()
            case .movieChart:
                return self.createMovieChartSection()
            case .special:
                return self.createSpecialSection()
            case .myCGV:
                return self.createMyCGVSection()
            case .todayCGV:
                return self.createTodayCGVSection()
            case .specialProgress, .todayProgress:
                return self.createProgressShareSection()
            case .specialRate, .todayRate:
                return self.createRateSection()
            case .bottomfooter:
                return self.createBottomFooter()
            }
        }
    }
    
    private func createTopViewSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(53)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = itemSize
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func createTopTabBarSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = itemSize
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(375),
            heightDimension: .absolute(100)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(375),
            heightDimension: .absolute(100)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func createMovieChartSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(160),
            heightDimension: .absolute(332)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(168),
            heightDimension: .absolute(332)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 66,
            leading: 20,
            bottom: 18,
            trailing: 20
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(32)
        )
        let midHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let tabBarSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let tabBar = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: tabBarSize,
            elementKind: "MidTabBar",
            alignment: .top,
            absoluteOffset: CGPoint(x: 0, y: 55)
        )
        
        section.boundarySupplementaryItems = [midHeader, tabBar]
        
        return section
    }
    
    private func createSpecialSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(335),
            heightDimension: .absolute(335)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(343),
            heightDimension: .absolute(335)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        section.visibleItemsInvalidationHandler = { [weak self] visibleItems, point, environment in
            let groupWidth = 343.0
            let pageIndex = Int((point.x + groupWidth / 2) / groupWidth)
            self?.updateSpecialProgress(for: pageIndex)
        }
        
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 66,
            leading: 20,
            bottom: 24,
            trailing: 20
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(32)
        )
        let midHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let tabBarSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let tabBar = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: tabBarSize,
            elementKind: "MidTabBar",
            alignment: .top,
            absoluteOffset: CGPoint(x: 0, y: 55)
        )
        
        section.boundarySupplementaryItems = [midHeader, tabBar]
        
        return section
    }
    
    private func createMyCGVSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(335),
            heightDimension: .absolute(50)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(343),
            heightDimension: .absolute(50 * 3 + 6 * 2)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 3
        )
        group.interItemSpacing = .fixed(6)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 34,
            leading: 20,
            bottom: 26,
            trailing: 20
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(32)
        )
        let midHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [midHeader]
        
        return section
    }
    
    private func createTodayCGVSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(335),
            heightDimension: .absolute(335)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(343),
            heightDimension: .absolute(335)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        section.visibleItemsInvalidationHandler = { [weak self] visibleItems, point, environment in
            let groupWidth = 343.0
            let pageIndex = Int((point.x + groupWidth / 2) / groupWidth)
            self?.updateTodayCGVProgress(for: pageIndex)
        }
        
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 66,
            leading: 20,
            bottom: 18,
            trailing: 20
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(32)
        )
        let midHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let tabBarSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let tabBar = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: tabBarSize,
            elementKind: "MidTabBar",
            alignment: .top,
            absoluteOffset: CGPoint(x: 0, y: 55)
        )
        
        section.boundarySupplementaryItems = [midHeader, tabBar]
        
        return section
    }
    
    private func createRateSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(335),
            heightDimension: .absolute(58)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(343),
            heightDimension: .absolute(58 * 3 + 10 * 2)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 3
        )
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 24,
            leading: 20,
            bottom: 14,
            trailing: 20
        )
        
        return section
    }
    
    private func createBottomFooter() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(375),
            heightDimension: .absolute(166)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(375),
            heightDimension: .absolute(166)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 33,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        
        return section
    }
    
    private func createProgressShareSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(375),
            heightDimension: .absolute(40)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(375),
            heightDimension: .absolute(40)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        
        return section
    }
}
