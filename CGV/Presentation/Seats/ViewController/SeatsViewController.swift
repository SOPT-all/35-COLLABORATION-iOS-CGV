//
//  SeatsViewController.swift
//  CGV
//
//  Created by 예삐 on 11/17/24.
//

import UIKit

final class SeatsViewController: BaseViewController {
    
    // MARK: - LifeCycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presentGuestCountSheet()
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
        
        self.present(guestCountSheetViewController, animated: true)
    }
}
