//
//  WelcomeViewController.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/04.
//

import UIKit

import SnapKit

final class WelcomeViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private lazy var welcomeView = WelcomeView()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        view.backgroundColor = .black
        view.addSubviews(welcomeView)
    }
    
    override func setLayout() {
        welcomeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        welcomeView.goMainButton.addTarget(self, action: #selector(tappedMypageButton), for: .touchUpInside)
    }
    
    func setUserName(name: String) {
        welcomeView.welcomeUserLabel.text = "\(name)님\n반가워요!"
    }
    
    private func setNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc
    private func tappedMypageButton() {
        let homeVC = HomeViewController()
        navigationController?.pushViewController(homeVC, animated: true)
    }
}

