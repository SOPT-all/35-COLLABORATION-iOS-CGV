//
//  BookingSheetViewController.swift
//  CGV
//
//  Created by 예삐 on 11/22/24.
//

import UIKit

protocol BookingSheetDelegate: AnyObject {
    func presentGuestCountSheet()
}

final class BookingSheetViewController: BaseViewController {
    
    // MARK: - Property
    
    private let rootView = BookingSheetView()
    private let movieService = MovieService()
    
    weak var delegate: BookingSheetDelegate?
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    // MARK: - Action
    
    override func setupAction() {
        rootView.editCountButton.addTarget(
            self,
            action: #selector(editCountButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.bookingButton.addTarget(
            self,
            action: #selector(bookingButtonDidTap),
            for: .touchUpInside
        )
    }
    
    @objc
    private func editCountButtonDidTap() {
        dismiss(animated: true) { [weak self] in
            self?.delegate?.presentGuestCountSheet()
        }
    }
    
    @objc
    private func bookingButtonDidTap() {
        
        let request = MovieBookingRequest(
            movieName: rootView.movieName(),
            theaterName: rootView.theaterName(),
            startTime: rootView.startTime(),
            endTime: rootView.endTime(),
            ticketCount: 1
        )
            
        movieService.bookingMovie(movieID: 1, request: request) { [weak self] result in
            switch result {
            case .success(let response):
                print("예매 성공: \(response)")
                self?.dismiss(animated: true, completion: nil)
            case .failure, .decodedError, .serverError, .networkFail:
                    print(result.stateDescription)
            }
        }
    }
}
