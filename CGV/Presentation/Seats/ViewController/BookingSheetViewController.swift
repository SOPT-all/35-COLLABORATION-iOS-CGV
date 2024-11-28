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
            movieName: "글래디에이터 2",
            theaterName: "구리",
            startTime: "2024-11-09T10:40",
            endTime: "2024-11-09T12:39",
            ticketCount: 1
        )
        
        let movieService = MovieService()
        
        movieService.bookingMovie(movieID: 1, request: request) { [weak self] result in
            switch result {
            case .success(let response):
                print("예매 성공: \(response)")
                self?.dismiss(animated: true, completion: nil)
            case .failure(let errorMessage):
                print("예매 실패: \(errorMessage)")
            case .decodedError:
                print("디코딩 실패")
            case .serverError:
                print("서버 오류 발생")
            case .networkFail:
                print("네트워크 오류 발생")
            }
        }
    }
}
