//
//  MyPageHeaderTopView.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/05.
//

import UIKit

class HeaderTopView: BaseUIView {
    
    // MARK: - UI Components
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .profile
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Doosan"
        label.font = .medium(size: 17)
        label.textColor = .white
        return label
    }()
    
    private let changeProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 전환", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .medium(size: 10)
        button.layer.cornerRadius = 4
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray4.cgColor
        button.isEnabled = false
        return button
    }()
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(profileImageView,
                         userNameLabel,
                         changeProfileButton)
    }
    
    override func setLayout() {
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(74)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(22)
            make.centerY.equalTo(profileImageView)
        }
        
        changeProfileButton.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView)
            make.trailing.equalToSuperview().inset(23)
            make.height.equalTo(25)
            make.width.equalTo(70)
        }
    }
}
