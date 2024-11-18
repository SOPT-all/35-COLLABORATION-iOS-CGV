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
    
    /// 네비게이션 바 등 추가적으로 UI와 관련한 작업
    func setupView() {}
    
    /// RootView로부터 액션 설정 (addTarget)
    func setupAction() {}
    
    /// RootView 또는 ViewController 자체로부터 Delegate, DateSource 등 설정
    func setupDelegate() {}
}
