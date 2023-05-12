//
//  MyPageTableViewCell.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/04.
//

import UIKit

import SnapKit

final class MyPageTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "MyPageTableViewCell"
    
    // MARK: - UI Components
    
    lazy var arrowButton = UIButton()
    
    lazy var serviceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray2
        label.font = .medium(size: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setLayout()
    }
        
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Functions
    
    func configureUI() {
        contentView.addSubviews(serviceLabel,
                                arrowButton)
    }
    
    func setLayout() {
        serviceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(18)
        }
        
        arrowButton.snp.makeConstraints { make in
            make.centerY.equalTo(serviceLabel)
            make.trailing.equalToSuperview().inset(18)
            make.height.equalTo(16.5)
            make.width.equalTo(18)
        }
    }
    
    func configureCell(_ myPage: MyPage) {
        serviceLabel.text = myPage.service
        arrowButton.setImage(myPage.buttonImage, for: .normal)
    }
}
