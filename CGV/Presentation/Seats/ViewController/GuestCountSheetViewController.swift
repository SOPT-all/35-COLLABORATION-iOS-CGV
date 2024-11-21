//
//  GuestCountSheetViewController.swift
//  CGV
//
//  Created by 예삐 on 11/19/24.
//

import UIKit

final class GuestCountSheetViewController: BaseViewController {
    
    // MARK: - Property
    
    private let rootView = GuestCountSheetView()
    
    private var totalGuestCount: Int = 0
    
    private var isValid: Bool = false
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    // MARK: - Action
    
    override func setupAction() {
        rootView.generalButton.minusButton.addTarget(
            self,
            action: #selector(guestCountButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.generalButton.plusButton.addTarget(
            self,
            action: #selector(guestCountButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.youthButton.minusButton.addTarget(
            self,
            action: #selector(guestCountButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.youthButton.plusButton.addTarget(
            self,
            action: #selector(guestCountButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.seniorButton.minusButton.addTarget(
            self,
            action: #selector(guestCountButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.seniorButton.plusButton.addTarget(
            self,
            action: #selector(guestCountButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.discountButton.minusButton.addTarget(
            self,
            action: #selector(guestCountButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.discountButton.plusButton.addTarget(
            self,
            action: #selector(guestCountButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.selectButton.addTarget(
            self,
            action: #selector(selectButtonDidTap),
            for: .touchUpInside
        )
    }
    
    // MARK: - Function

    private func calcTotalGuestCount() {
        let generalCount = rootView.generalButton.currentCount
        let youthCount = rootView.youthButton.currentCount
        let seniorCount = rootView.seniorButton.currentCount
        let discountCount = rootView.discountButton.currentCount
        
        totalGuestCount = generalCount + youthCount + seniorCount + discountCount
    }
    
    private func checkValid() {
        isValid = totalGuestCount >= 1 && totalGuestCount <= 8
        
        rootView.selectButton.backgroundColor = isValid ? .cgvR400 : .cgvG500
        rootView.selectButton.isEnabled = isValid ? true : false
    }
    
    @objc
    private func guestCountButtonDidTap() {
        calcTotalGuestCount()
        checkValid()
    }
    
    @objc
    private func selectButtonDidTap() {
        dismiss(animated: true, completion: nil)
    }
}
