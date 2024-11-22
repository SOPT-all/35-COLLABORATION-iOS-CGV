//
//  SeatsViewController.swift
//  CGV
//
//  Created by 예삐 on 11/17/24.
//

import UIKit

final class SeatsViewController: BaseViewController {
    
    // MARK: - Property

    private let rootView = SeatsView()
    
    private let timeList = SeatsTimeModel.mockTimeData()
    
    final let cellWidth: CGFloat = 90
    final let cellHeight: CGFloat = 63
    final let contentInterSpacing: CGFloat = 4
    final let contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cgvG850
        register()
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
        rootView.seatsImage.addTarget(
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
    
    @objc
    private func seatsImageDidTap() {
        rootView.seatsImage.isSelected.toggle()
        let image = rootView.seatsImage.isSelected ? UIImage.imgSeatsSelected : UIImage.imgSeatsUnselected
        rootView.seatsImage.setImage(image, for: .normal)
        
        if rootView.seatsImage.isSelected {
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
        return timeList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SeatsCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? SeatsCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(timeList[indexPath.row])
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
