//
//  MyPageHeaderBottomView.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/05.
//

import UIKit

class HeaderMiddleView: BaseUIView {
    
    // MARK: -  UI components
    
    private let ticketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .ticket
        return imageView
    }()
    
    private let ticketLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 이용권"
        label.font = .medium(size: 13)
        label.textColor = .gray3
        return label
    }()
    
    private lazy var myTicketLabel: UILabel = {
        let label = UILabel()
        label.text = "사용중인 이용권이 없습니다."
        label.font = .medium(size: 13)
        label.textColor = .gray3
        return label
    }()
    
    private let cashImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .coin
        return imageView
    }()
    
    private let cashLabel: UILabel = {
        let label = UILabel()
        label.text = "티빙캐시"
        label.font = .medium(size: 13)
        label.textColor = .gray3
        return label
    }()
    
    private lazy var myCashLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .bold(size: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var ticketStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ticketImageView, ticketLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var cashStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cashImageView, cashLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var myInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ticketStackView, cashStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 17
        return stackView
    }()
    
    // MARK: - Functions
    
    override func configureUI() {
        self.backgroundColor = .gray5
        self.layer.cornerRadius = 3
        self.addSubviews(myInfoStackView,
                         myTicketLabel,
                         myCashLabel)
    }
    
    override func setLayout() {
        myInfoStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(11)
        }
        
        myTicketLabel.snp.makeConstraints { make in
            make.centerY.equalTo(ticketLabel)
            make.trailing.equalToSuperview().inset(13)
        }
        
        myCashLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cashLabel)
            make.trailing.equalToSuperview().inset(13)
        }
        
        ticketImageView.snp.makeConstraints { make in
            make.height.width.equalTo(15)
        }
        
        cashImageView.snp.makeConstraints { make in
            make.height.width.equalTo(15)
        }
    }
}
