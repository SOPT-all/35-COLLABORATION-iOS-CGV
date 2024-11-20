//
//  GuestCountSheetViewController.swift
//  CGV
//
//  Created by 예삐 on 11/19/24.
//

import UIKit

final class GuestCountSheetViewController: BaseViewController {
    
    private let rootView = GuestCountSheetView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
