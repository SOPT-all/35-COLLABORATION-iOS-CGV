//
//  TimeViewController.swift
//  CGV
//
//  Created by 예삐 on 11/17/24.
//

import UIKit

final class TimeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presentTimeBottomSheet()
    }
}

extension TimeViewController: UIAdaptivePresentationControllerDelegate {
    func presentTimeBottomSheet() {
        let timeBottomSheetViewController = TimeBottomSheetViewController()
        
        let fraction = UISheetPresentationController.Detent.custom {
            _ in self.view.frame.height * ((686-32)/812)
        }
        if let sheet = timeBottomSheetViewController.sheetPresentationController {
            sheet.detents = [fraction]
            sheet.preferredCornerRadius = 16
        }
        self.present(timeBottomSheetViewController, animated: true)
    }
}

#Preview {
    TimeViewController()
}
