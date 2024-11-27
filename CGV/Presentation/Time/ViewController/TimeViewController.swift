//
//  TimeViewController.swift
//  CGV
//
//  Created by 예삐 on 11/17/24.
//

import UIKit
import SwiftUI

import SnapKit

final class TimeViewController: BaseViewController {
    
    // MARK: - Property
    
    private var dateInfoData = DateInfo.mockData()
    private var timeViewModel: TimeSwiftUIViewModel?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timeViewModel = .init(
            theaterChangeButtonAction: {
                self.presentTimeBottomSheet()
            }, closeButtonAction: {
                print("closeButtonAction")
            }
        )
        setupHostingController()
        presentTimeBottomSheet()
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        timeViewModel?.theaterTimeTables = TheaterTimeTable.makeMockData()
    }
    
    // MARK: - Function
    
    private func setupHostingController() {
        guard let viewModel = timeViewModel else { return }
        
        let hostingController = UIHostingController(
            rootView: TimeSwiftUIView(viewModel: viewModel)
        )
                
        addChild(hostingController)
        
        hostingController.view.frame = view.frame
        
        view.addSubview(hostingController.view)
                
        hostingController.didMove(toParent: self)
    }
}

// MARK: - UIAdaptivePresentationControllerDelegate

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
