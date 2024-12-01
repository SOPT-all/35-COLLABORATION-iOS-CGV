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
    private let theaterService = TheaterService()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timeViewModel = .init(
            theaterService: theaterService,
            theaterChangeButtonAction: {
                self.presentTimeBottomSheet()
            }, closeButtonAction: {
                self.closeButtonDidTap()
            }, timeTableCellButtonAction: {
                self.pushSeatsViewController()
            }
        )
        setupHostingController()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }

    override func viewDidAppear(_ animated: Bool) {
        presentTimeBottomSheet()
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
    
    private func closeButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func pushSeatsViewController() {
        self.navigationController?.pushViewController(SeatsViewController(), animated: true)
    }
}

// MARK: - UIAdaptivePresentationControllerDelegate

extension TimeViewController: UIAdaptivePresentationControllerDelegate {
    func presentTimeBottomSheet() {
        let timeBottomSheetViewController = TimeBottomSheetViewController()
        timeBottomSheetViewController.theaterService = theaterService
        timeBottomSheetViewController.delegate = self
        
        let fraction = UISheetPresentationController.Detent.custom {
            _ in self.view.frame.height * ((Screen.height(683) - Screen.height(32)) / Screen.height(812))
        }
        if let sheet = timeBottomSheetViewController.sheetPresentationController {
            sheet.detents = [fraction]
            sheet.preferredCornerRadius = 16
        }
        self.present(timeBottomSheetViewController, animated: true)
        self.timeViewModel?.theaterTimeTables = []
    }
}

extension TimeViewController: TimeBottomSheetViewControllerDelegate {
    func didTappedSelect(_ theaters: [TheaterInfo]) {
        timeViewModel?.theaterInfo = theaters
        timeViewModel?.fetchTheaterInfo()
    }
    
}
