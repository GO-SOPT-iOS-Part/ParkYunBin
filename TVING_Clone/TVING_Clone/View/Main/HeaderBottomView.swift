//
//  HeaderBottomView.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/05.
//

import UIKit

class HeaderBottomView: BaseUIView {

    // MARK: - UI Components
    
    private let beforeImageLabel: UILabel = {
        let label = UILabel()
        label.text = "이용권을 구매하고"
        label.font = .semiBold(size: 12)
        label.textColor = .gray2
        return label
    }()
    
    private let afterImageLabel: UILabel = {
        let label = UILabel()
        label.text = "등 인기 TV프로그램과"
        label.font = .semiBold(size: 12)
        label.textColor = .gray2
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "다양한 영화 콘텐츠를 자유롭게 시청하세요!"
        label.font = .semiBold(size: 12)
        label.textColor = .gray2
        return label
    }()
    
    private let tvnImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .tvn
        return imageView
    }()
    
    private let jtbcImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .jtbc
        return imageView
    }()
    
    private lazy var firstLineStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [beforeImageLabel,
                                                       tvnImage,
                                                       jtbcImage,
                                                       afterImageLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var subscribeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstLineStackView, bottomLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    
    private let arrowButton: UIButton = {
        let button = UIButton()
        button.setImage(.arrow, for: .normal)
        return button
    }()
    
    // MARK: - Functions
    
    override func configureUI() {
        self.backgroundColor = .gray5
        self.layer.cornerRadius = 3
        self.addSubviews(subscribeStackView,
                         arrowButton)
    }
    
    override func setLayout() {
        
        subscribeStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(11)
            make.leading.equalToSuperview().inset(18)
        }
        
        tvnImage.snp.makeConstraints { make in
            make.height.equalTo(10)
            make.width.equalTo(24.81)
        }
        
        jtbcImage.snp.makeConstraints { make in
            make.height.equalTo(10)
            make.width.equalTo(24.81)
        }
        
        arrowButton.snp.makeConstraints { make in
            make.height.width.equalTo(16)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(13)
        }
    }

}
