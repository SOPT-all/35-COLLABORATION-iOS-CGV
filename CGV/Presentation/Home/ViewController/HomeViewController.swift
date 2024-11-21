//
//  HomeViewController.swift
//  CGV
//
//  Created by 예삐 on 11/17/24.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    private let homeView = HomeView()
    
    private var dataSource: UICollectionViewDiffableDataSource<HomeSectionType, HomeItem>!
    
    // MARK: - LifeCycle
    
    override func loadView() {
        let rootView = UIView()
        rootView.addSubviews(homeView)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        homeView.collectionView.collectionViewLayout = createLayout()
        homeView.setCollectionView()
        configureDataSource()
        applyInitialSnapshots()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
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
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: TopHeaderViewCell.reuseIdentifier,
                    for: indexPath
                ) as! TopHeaderViewCell
                return cell
                
            case .topTabBar:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: TopTabBarCell.reuseIdentifier,
                    for: indexPath
                ) as! TopTabBarCell
                cell.configure(action: #selector(self.topTabBarChanged(_:)), target: self)
                return cell
                
            case .banner:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: BannerImageCell.reuseIdentifier,
                    for: indexPath
                ) as! BannerImageCell
                cell.configure(image: item.image)
                return cell
                
            case .movieChart:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MovieChartCell.reuseIdentifier,
                    for: indexPath
                ) as! MovieChartCell
                cell.configure(
                    poster: item.image,
                    title: item.title,
                    ageLimit: item.ageLimit,
                    preEgg: item.preEgg ?? "",
                    dDay: item.dDay ?? ""
                )
                return cell
                
            case .special,
                    .todayCGV:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: BigImageCell.reuseIdentifier,
                    for: indexPath
                ) as! BigImageCell
                cell.configure(image: item.image)
                return cell
                
            case .myCGV:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MyCGVCell.reuseIdentifier,
                    for: indexPath
                ) as! MyCGVCell
                cell.configure(
                    title: item.title,
                    rate: item.rate ?? "",
                    image: item.image
                )
                return cell
                
            case .specialRate, .todayRate:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ReserveRateCell.reuseIdentifier,
                    for: indexPath
                ) as! ReserveRateCell
                cell.configure(
                    title: item.title,
                    rate: item.rate ?? "",
                    image: item.image
                )
                return cell
            }
            
        }
        
        dataSource.supplementaryViewProvider = {
            collectionView,
            kind,
            indexPath in
            let section = HomeSectionType(rawValue: indexPath.section)
            
            if kind == UICollectionView.elementKindSectionHeader {
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: MidHeaderView.identifier,
                    for: indexPath
                ) as! MidHeaderView
                header.configure(
                    title: section?.headerTitle ?? "",
                    subtitle: section?.headerSubtitle ?? ""
                )
                return header
            } else if kind == "TabBarKind" {
                let tabBar = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: MidTabBarView.identifier,
                    for: indexPath
                ) as! MidTabBarView
                
                if let tabs = section?.midTabBarTitle {
                    tabBar.configure(tabs: tabs)
                }
                
                tabBar.didSelectTab = { selectedIndex in
                    print("Selected Tab Index: \(selectedIndex)")
                }
                return tabBar
            }
            return UICollectionReusableView()
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
    
    @objc private func topTabBarChanged(_ sender: UISegmentedControl) { }
    
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
            case .specialRate, .todayRate:
                return self.createRateSection()
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
            elementKind: "TabBarKind",
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
            elementKind: "TabBarKind",
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
            elementKind: "TabBarKind",
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
            top: 36,
            leading: 20,
            bottom: 14,
            trailing: 20
        )
        
        return section
    }
}
