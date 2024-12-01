//
//  TimeBottomSheetViewController.swift
//  CGV
//
//  Created by 최안용 on 11/19/24.
//

import UIKit

protocol TimeBottomSheetViewControllerDelegate: AnyObject {
    func didTappedSelect(_ theaters: [TheaterInfo])
}

final class TimeBottomSheetViewController: BaseViewController {
    
    // MARK: - Property
        
    private let rootView = TimeBottomSheetView()
    private var isValid: Bool = false
    
    var theaterService: TheaterService?
    var selectedTheaters: [TheaterInfo] = []
    weak var delegate: TimeBottomSheetViewControllerDelegate?
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }

    override func setupAction() {
        rootView.selectButton.addTarget(
            self,
            action: #selector(selectButtonDidTap),
            for: .touchUpInside
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchTheaters()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.didTappedSelect(selectedTheaters)
    }
}

// MARK: - Function

extension TimeBottomSheetViewController {
    private func checkValid() {
        isValid = selectedTheaters.isEmpty
        
        rootView.selectButton.backgroundColor = isValid ? .cgvG500 : .cgvR400
        rootView.selectButton.isEnabled = isValid ? false : true
    }
    
    private func fetchTheaters() {
        theaterService?.fetchMovieTheater(request: EmptyModel()) { [weak self] result in
            switch result {
            case .success(let response):
                self?.rootView.makeTheaterButton(
                    theaters: response.data,
                    target: self,
                    action: #selector(self?.theaterButtonDidTap(_:))
                )
            case .failure, .decodedError, .serverError, .networkFail:
                print(result.stateDescription)
            }
        }
    }
    
    @objc
    private func theaterButtonDidTap(_ sender: TheaterButton) {
        guard let theater = sender.theater else { return }
        
        if sender.isSelected {
            guard let index = selectedTheaters.firstIndex(where: {
                $0.theaterId == theater.theaterId
            }) else { return }
            
            selectedTheaters.remove(at: index)
            rootView.deleteTheaterChipButton(theater: theater)
        } else {
            selectedTheaters.append(theater)
            rootView.makeTheaterChipButton(
                theater: theater,
                target: self,
                action: #selector(self.theaterChipButtonDidTap(_:))
            )
        }
        checkValid()
        sender.isSelected.toggle()
    }
    
    @objc
    private func theaterChipButtonDidTap(_ sender: TheaterChipButton) {
        guard let theater = sender.theater else { return }
        guard let index = selectedTheaters.firstIndex(where: {
            $0.theaterId == theater.theaterId
        }) else { return }
        
        selectedTheaters.remove(at: index)
        rootView.deleteTheaterChipButton(theater: theater)
        changeTheaterButtonState(theater: theater)
        checkValid()
    }
    
    @objc
    private func selectButtonDidTap() {
        dismiss(animated: true)
    }
    
    private func changeTheaterButtonState(theater: TheaterInfo) {
        for subview in rootView.recentStackView.subviews {
            if let button = subview as? TheaterButton {
                if button.theater?.theaterId == theater.theaterId {
                    button.isSelected = false
                    break
                }
            }
        }
        
        for subview in rootView.surroundingStackView.subviews {
            if let button = subview as? TheaterButton {
                if button.theater?.theaterId == theater.theaterId {
                    button.isSelected = false
                    break
                }
            }
        }
    }
}
