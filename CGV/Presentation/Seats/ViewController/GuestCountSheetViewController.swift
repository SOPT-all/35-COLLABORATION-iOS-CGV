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
    
    private let movieService = MovieService()
    
    private var totalGuestCount: Int = 0
    
    private var isValid: Bool = false
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestMovieDetail()
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
    
    private func requestMovieDetail() {
        movieService.fetchMovieDetail(movieID: 1, request: EmptyModel()) { [weak self] response in
            switch response {
            case .success(let data):
                let data = data.data.compactMap{ $0 }
                if let first = data.first {
                    self?.rootView.titleLabel.updateText(first.movieName)
                    self?.rootView.dateLabel.updateText(first.releaseDate)
                    self?.rootView.theaterLabel.updateText(first.theaterName)
                    
                    let startTime = self?.extractTime(from: first.startTime)
                    let endTime = self?.extractTime(from: first.endTime)
                    if let startTime, let endTime {
                        self?.rootView.timeLabel.updateText("\(startTime)~\(endTime)")
                    }
                }
            default:
                print(response.stateDescription)
            }
        }
    }
    
    private func extractTime(from dateTime: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        guard let date = dateFormatter.date(from: dateTime) else {
            print("Invalid date format")
            return nil
        }
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        
        return timeFormatter.string(from: date)
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
