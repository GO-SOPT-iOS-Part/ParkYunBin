//
//  WelcomeViewController.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/15.
//

import UIKit

import SnapKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var username = ""
    
    // MARK: - UI Components
    
    private let tvingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tving.svg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var welcomeUserLabel: UILabel = {
        let label = UILabel()
        label.text = "\(username)님\n반가워요!"
        label.font = .bold(size: 23)
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private lazy var goMainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .semiBold(size: 14)
        button.backgroundColor = .primary
        button.layer.cornerRadius = 3
        return button
    }()
    
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
        view.addSubviews(tvingImageView,
                         welcomeUserLabel,
                         goMainButton)
    }
    
    private func setLayout() {
        tvingImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(210.94)
        }
        
        welcomeUserLabel.snp.makeConstraints { make in
            make.top.equalTo(tvingImageView.snp.bottom).offset(67)
            make.centerX.equalToSuperview()
        }
        
        goMainButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-66)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
    }
    
    func setUserName(name: String) {
        username = name
    }
    
    private func setNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
}
