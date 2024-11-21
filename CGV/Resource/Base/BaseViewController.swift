//
//  BaseViewController.swift
//  CGV
//
//  Created by 예삐 on 11/18/24.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupView()
        setupAction()
        setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    /// 네비게이션 바 등 추가적으로 UI와 관련한 작업
    func setupView() {}
    
    /// RootView로부터 액션 설정 (addTarget)
    func setupAction() {}
    
    /// RootView 또는 ViewController 자체로부터 Delegate, DateSource 등 설정
    func setupDelegate() {}
}

extension BaseViewController {
    
    /// 네비게이션 바 타이틀 및 배경색 설정
    func setupNavigationBarTitle(with string: String, backgroundColor: UIColor) {
        title = string
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = backgroundColor
        barAppearance.shadowColor = nil
        
        barAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.cgvWhite,
            .font: UIFont.setupFont(of: Kopub.head5)
        ]
        
        navigationController?.navigationBar.standardAppearance = barAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
    }
    
    /// 네비게이션 바 BackButton 구성
    func setupNavigationBarBackButton() {
        let backButton = UIBarButtonItem(
            image: .icBack,
            style: .plain,
            target: self,
            action: #selector(backButtonDidTap)
        ).then {
            $0.tintColor = .cgvWhite
        }
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc
    func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
