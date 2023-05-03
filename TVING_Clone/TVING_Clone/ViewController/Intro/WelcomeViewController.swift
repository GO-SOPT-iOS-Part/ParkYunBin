//
//  WelcomeViewController.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/04.
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
        setActionEvent()
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
    
    private func setActionEvent() {
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

