//
//  SignInView.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/12.
//

import UIKit

class SignInView: UIView {
    
    // MARK: - UI Components
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_before.svg"), for: .normal)
        return button
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .white
        label.font = .medium(size: 23)
        return label
    }()
    
    // FIXME: clearButton의 이미지를 변경하는 코드를 어떻게 깔끔하게 쓰지요,,,?!
    
    lazy var idTextField: UITextField = {
        let textField = UITextField()
        if let clearButton = textField.value(forKeyPath: "_clearButton") as? UIButton {
            clearButton.setImage(UIImage(named: "remove.svg"), for: .normal)
        }
        textField.placeholder = "아이디"
        textField.font = .semiBold(size: 15)
        textField.textColor = .gray2
        textField.backgroundColor = .gray4
        textField.autocapitalizationType = .none
        textField.setPlaceholderColor(.gray2)
        textField.setLeftPaddingPoints(22)
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = .semiBold(size: 15)
        textField.backgroundColor = .gray4
        textField.textColor = .gray2
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.rightView?.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        textField.setPlaceholderColor(.gray2)
        textField.setLeftPaddingPoints(22)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = .semiBold(size: 14)
        button.layer.cornerRadius = 4
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray4.cgColor
        button.isEnabled = false
        return button
    }()
    
    private lazy var findIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.gray3, for: .normal)
        button.titleLabel?.font = .semiBold(size: 14)
        return button
    }()
    
    private lazy var findPWButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.gray3, for: .normal)
        button.titleLabel?.font = .semiBold(size: 14)
        return button
    }()
    
    private let seperateBar: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    private let findAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = .semiBold(size: 14)
        label.textColor = .gray3
        return label
    }()
    
    private lazy var makeNickNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = .regular(size: 14)
        button.setUnderline()
        return button
    }()
    
    private lazy var findAccountStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [findIDButton, seperateBar, findPWButton])
        stackView.axis = .horizontal
        stackView.spacing = 33
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var makeAccountStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [findAccountLabel, makeNickNameButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var removeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "remove.svg"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    lazy var securityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eye-slash.png"), for: .normal)
        button.isUserInteractionEnabled = true
        button.isHidden = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func configureUI() {
        
        self.addSubviews(backButton,
                         loginLabel,
                         idTextField,
                         passwordTextField,
                         loginButton,
                         findAccountStackView,
                         makeAccountStackView,
                         removeButton,
                         securityButton)
    }
    
    func setLayout() {
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65)
            make.leading.equalToSuperview().offset(24)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(31)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(21)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        findAccountStackView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(31)
            make.centerX.equalToSuperview()
        }
        
        makeAccountStackView.snp.makeConstraints { make in
            make.top.equalTo(findAccountStackView.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
        }
        
        seperateBar.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.width.equalTo(1)
        }
        
        securityButton.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.trailing.equalTo(passwordTextField).offset(-20)
            make.centerY.equalTo(passwordTextField)
        }
        
        removeButton.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.trailing.equalTo(passwordTextField).offset(-56)
            make.centerY.equalTo(passwordTextField)
        }
    }
}
