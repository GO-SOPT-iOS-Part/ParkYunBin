//
//  WelcomeViewController.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/15.
//

import UIKit

import SnapKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var welcomeView = WelcomeView()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setNavigationBar()
    }
    
    // MARK: - Functions
    
    private func configureUI() {
        view.backgroundColor = .black
        view.addSubviews(welcomeView)
    }
    
    private func setLayout() {
        welcomeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setUserName(name: String) {
        welcomeView.welcomeUserLabel.text = "\(name)님\n반가워요!"
    }
    
    private func setNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
}
