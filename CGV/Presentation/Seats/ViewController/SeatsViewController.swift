//
//  SeatsViewController.swift
//  CGV
//
//  Created by 예삐 on 11/17/24.
//

import UIKit

final class SeatsViewController: BaseViewController {
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cgvG850
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
}

// MARK: - UIAdaptivePresentationControllerDelegate

extension SeatsViewController: UIAdaptivePresentationControllerDelegate {
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
}
