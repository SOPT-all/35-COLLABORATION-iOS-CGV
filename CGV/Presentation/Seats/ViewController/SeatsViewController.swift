//
//  SeatsViewController.swift
//  CGV
//
//  Created by 예삐 on 11/17/24.
//

import UIKit

final class SeatsViewController: BaseViewController, UIAdaptivePresentationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let guestCountSheetViewController = GuestCountSheetViewController()
        
        let fraction = UISheetPresentationController.Detent.custom { _ in 465 }
        if let sheet = guestCountSheetViewController.sheetPresentationController {
            sheet.detents = [fraction]
        }
        self.present(guestCountSheetViewController, animated: true)
    }
        
}
