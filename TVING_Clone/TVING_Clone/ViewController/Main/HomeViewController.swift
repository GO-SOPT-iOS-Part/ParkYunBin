//
//  HomeViewController.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/04.
//

import UIKit

import SnapKit

final class HomeViewController: UIViewController {
    
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
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
    }
    
    // MARK: - Functions
    
    private func configureUI() {
        view.backgroundColor = .black
        view.addSubviews(goMyPageButton)
    }
    
    private func setLayout() {
        goMyPageButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }
}

