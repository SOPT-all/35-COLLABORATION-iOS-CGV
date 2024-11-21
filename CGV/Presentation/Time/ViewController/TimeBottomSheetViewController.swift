//
//  TimeBottomSheetViewController.swift
//  CGV
//
//  Created by 최안용 on 11/19/24.
//

import UIKit

final class TimeBottomSheetViewController: BaseViewController {
    private let rootView = TimeBottomSheetView()
    
    private var selectedTheaters: [TheaterInfo] = []
    private var isValid: Bool = false
    
    override func loadView() {
        view = rootView
    }

    override func setupAction() {
        for button in rootView.theatersButtons {
            button.addTarget(
                self,
                action: #selector(theaterButtonDidTap( _:)),
                for: .touchUpInside
            )
        }
        
        rootView.selectButton.addTarget(
            self,
            action: #selector(selectButtonDidTap),
            for: .touchUpInside
        )
    }
}

extension TimeBottomSheetViewController {
    private func checkValid() {
        isValid = selectedTheaters.isEmpty
        
        rootView.selectButton.backgroundColor = isValid ? .cgvG500 : .cgvR400
        rootView.selectButton.isEnabled = isValid ? false : true
    }
    
    @objc
    private func theaterButtonDidTap(_ sender: TheaterButton) {
        guard let theater = sender.theater else { return }
        if sender.isSelected {
            guard let index = selectedTheaters.firstIndex(where: {
                $0.theaterId == theater.theaterId
            }) else { return }
            
            selectedTheaters.remove(at: index)
            rootView.deleteTheaterChipButton(theater: theater.theaterName)
        } else {
            selectedTheaters.append(theater)
            rootView.makeTheaterChipButton(theater: theater.theaterName)
        }
        checkValid()
        sender.isSelected.toggle()
    }
    
    @objc
    private func selectButtonDidTap() {
        dismiss(animated: true)
    }
}
