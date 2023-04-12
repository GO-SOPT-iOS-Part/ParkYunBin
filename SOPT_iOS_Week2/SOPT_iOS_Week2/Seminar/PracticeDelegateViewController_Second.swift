//
//  SecondPracticeViewController.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/08.
//

import UIKit

import Then
import SnapKit

protocol DataBindProtocol: AnyObject {
    func dataBind(count: Int)
}

final class PracticeDelegateViewController_Second: UIViewController {
    
    // MARK: - Properties
    
    private var count = 0
    
    // MARK: - UI Components
    
    private lazy var countLabel = UILabel().then {
        $0.text = "횟수는?"
        $0.textColor = .orange
        $0.font = .systemFont(ofSize: 20)
    }
    
    private lazy var pushButton = UIButton().then {
        $0.setTitle("눌러줘!", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.setTitleColor(.black, for: .normal)
    }
    
    private let backButton = UIButton().then {
        $0.setTitle("이전으로", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.setTitleColor(.black, for: .normal)
    }
    
    weak var delegate: DataBindProtocol?
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponent()
        setLayout()
        setButtonEvent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.dataBind(count: count)
    }
}

// MARK: - Functions

extension PracticeDelegateViewController_Second {
    
    func addComponent() {
        [countLabel, pushButton, backButton].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        
        view.backgroundColor = .systemBackground
        
        countLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        pushButton.snp.makeConstraints { make in
            make.top.equalTo(countLabel.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.centerX.equalTo(countLabel)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(pushButton.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.centerX.equalTo(countLabel)
        }
    }
    
    func setButtonEvent() {
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(tappedPlusButton), for: .touchUpInside)
    }
    
    @objc
    func tappedBackButton() {
        delegate?.dataBind(count: count)
        self.dismiss(animated: true)
    }
    
    @objc
    func tappedPlusButton() {
        count += 1
    }
}
