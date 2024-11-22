//
//  BookingSheetViewController.swift
//  CGV
//
//  Created by 예삐 on 11/22/24.
//

import UIKit

final class BookingSheetViewController: BaseViewController {
    
    // MARK: - Property
    
    private let rootView = BookingSheetView()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
}
