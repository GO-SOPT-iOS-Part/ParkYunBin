//
//  MyPageFooterView.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/05.
//

import UIKit

class MyPageFooterView: BaseUIView {
    
    // MARK: - UI Components

    private let footerButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = .semiBold(size: 14)
        button.layer.cornerRadius = 4
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray4.cgColor
        button.isEnabled = false
        return button
    }()
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(footerButton)
    }
    
    override func setLayout() {
        footerButton.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.leading.trailing.equalToSuperview().inset(8)
        }
    }
}
