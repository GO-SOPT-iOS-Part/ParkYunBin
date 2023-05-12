//
//  HomeViewController.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/04.
//

import UIKit

import SnapKit

final class HomeViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let goMyPageButton: UIButton = {
        let button = UIButton()
        button.setTitle("마이페이지로 이동!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .semiBold(size: 14)
        button.layer.cornerRadius = 4
        button.backgroundColor = .primary
        return button
    }()
    
    // MARK: - Functions
    
    override func configureUI() {
        view.backgroundColor = .black
        view.addSubviews(goMyPageButton)
    }
    
    override func setLayout() {
        goMyPageButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }
    
    override func setButtonEvent() {
        goMyPageButton.addTarget(self, action: #selector(tappedMyPageButton), for: .touchUpInside)
    }
    
    @objc
    private func tappedMyPageButton() {
        let myPageVC = MyPageViewController()
        navigationController?.pushViewController(myPageVC, animated: true)
    }
}

