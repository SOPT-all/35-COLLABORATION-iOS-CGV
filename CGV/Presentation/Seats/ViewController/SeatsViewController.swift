//
//  SeatsViewController.swift
//  CGV
//
//  Created by 예삐 on 11/17/24.
//

import UIKit

import Kingfisher

final class SeatsViewController: BaseViewController {
    
    // MARK: - Property

    private let rootView = SeatsView()
    
    private let movieService = MovieService()
    
    private var movieDetailList: [MovieDetailResponse] = []
    
    final let cellWidth: CGFloat = Screen.width(90)
    final let cellHeight: CGFloat = Screen.height(63)
    final let contentInterSpacing: CGFloat = 4
    final let contentInset = UIEdgeInsets(top: 0, left: Screen.width(20), bottom: 0, right: Screen.width(20))
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cgvG850
        register()
        requestMovieDetail()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presentGuestCountSheet()
    }
    
    // MARK: - Function

    override func setupView() {
        setupNavigationBarTitle(with: "[IMAX LASER 2D]", backgroundColor: .cgvG850)
        setupNavigationBarBackButton()
    }
    
    override func setupAction() {
        rootView.seatsButton.addTarget(
            self,
            action: #selector(seatsImageDidTap),
            for: .touchUpInside
        )
    }
    
    override func setupDelegate() {
        rootView.seatsCollectionView.delegate = self
        rootView.seatsCollectionView.dataSource = self
    }
    
    private func register() {
        rootView.seatsCollectionView.register(
            SeatsCollectionViewCell.self,
            forCellWithReuseIdentifier: SeatsCollectionViewCell.reuseIdentifier
        )
    }
    
    private func requestMovieDetail() {
        movieService.fetchMovieDetail(movieID: 1, request: EmptyModel()) { [weak self] response in
            switch response {
            case .success(let data):
                let data = data.data.compactMap{ $0 }
                self?.movieDetailList = data
                self?.rootView.seatsCollectionView.reloadData()
                if let first = data.first {
                    self?.setupNavigationBarTitle(
                        with: "[\(first.theaterName)]",
                        backgroundColor: .cgvG850
                    )
                }
                if let urlString = data.first?.seatiOS, let url = URL(string: urlString) {
                    self?.rootView.seatsImage.kf.setImage(with: url)
                }
            default:
                print(response.stateDescription)
            }
        }
    }
    
    @objc
    private func seatsImageDidTap() {
        rootView.seatsButton.isSelected.toggle()
        rootView.seatsImage.image = rootView.seatsButton.isSelected ? .imgSeatsSelected : .imgSeatsUnselected
        
        if rootView.seatsButton.isSelected {
            presentBookingSheet()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension SeatsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return contentInterSpacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return contentInset
    }
}

// MARK: - UICollectionViewDataSource

extension SeatsViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return movieDetailList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SeatsCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? SeatsCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(movieDetailList[indexPath.row])
        if indexPath.row == 0 {
            cell.timeView.backgroundColor = .cgvWhite
            cell.seatsView.backgroundColor = .cgvG100
            cell.endTimeLabel.textColor = .cgvG600
            cell.remainSeatsLabel.setHighlightText("183", style: Malgun.body3, color: .cgvR400)
        }
        
        return cell
    }
}

// MARK: - UIAdaptivePresentationControllerDelegate

extension SeatsViewController: UIAdaptivePresentationControllerDelegate, BookingSheetDelegate {
    func presentGuestCountSheet() {
        let guestCountSheetViewController = GuestCountSheetViewController()
        
        let fraction = UISheetPresentationController.Detent.custom {
            _ in self.view.frame.height * ((465-32)/812)
        }
        if let sheet = guestCountSheetViewController.sheetPresentationController {
            sheet.detents = [fraction]
            sheet.preferredCornerRadius = 20
        }
        guestCountSheetViewController.isModalInPresentation = true
        
        self.present(guestCountSheetViewController, animated: true)
    }
    
    func presentBookingSheet() {
        let bookingSheetViewController = BookingSheetViewController()
        bookingSheetViewController.delegate = self
        
        let fraction = UISheetPresentationController.Detent.custom {
            _ in self.view.frame.height * ((280-32)/812)
        }
        if let sheet = bookingSheetViewController.sheetPresentationController {
            sheet.detents = [fraction]
            sheet.preferredCornerRadius = 20
            sheet.prefersGrabberVisible = true
        }
        
        self.present(bookingSheetViewController, animated: true)
    }
}
