//
//  BookingSheetViewController.swift
//  CGV
//
//  Created by 예삐 on 11/22/24.
//

import UIKit

protocol BookingSheetDelegate: AnyObject {
    func presentGuestCountSheet()
}

final class BookingSheetViewController: BaseViewController {
    
    // MARK: - Property
    
    private let rootView = BookingSheetView()
    
    weak var delegate: BookingSheetDelegate?
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    // MARK: - Action
    
    override func setupAction() {
        rootView.editCountButton.addTarget(
            self,
            action: #selector(editCountButtonDidTap),
            for: .touchUpInside
        )
    }
    
    @objc
    private func editCountButtonDidTap() {
        dismiss(animated: true) { [weak self] in
            self?.delegate?.presentGuestCountSheet()
        }
    }
}
