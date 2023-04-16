//
//  SignInViewController.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/10.
//

import UIKit

import SnapKit

class SignInViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var isIDTextFieldFull = false
    private lazy var isPWTextFieldFull = false
    
    // MARK: - UI Components
    
    private lazy var signInView = SignInView()
    
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setActionEvent()
    }
    
    // MARK: - Functions

    func configureUI() {
        view.addSubview(signInView)
    }
    
    func setLayout() {
        signInView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setActionEvent() {
        signInView.idTextField.addTarget(self, action: #selector(editIDTextField), for: .editingChanged)
        signInView.passwordTextField.addTarget(self, action: #selector(editPasswordTextField), for: .editingChanged)
        signInView.removeButton.addTarget(self, action: #selector(tappedRemoveButton), for: .touchUpInside)
        signInView.securityButton.addTarget(self, action: #selector(tappedSecurityButton), for: .touchUpInside)
        signInView.loginButton.addTarget(self, action: #selector(tappedLogInButton), for: .touchUpInside)
    }
    
    @objc
    func editIDTextField(sender: UITextField) {
        if sender.text?.isEmpty == true {
            isIDTextFieldFull = false
            checkTextField()
        } else {
            isIDTextFieldFull = true
            checkTextField()
        }
    }
    
    @objc
    func editPasswordTextField(sender: UITextField) {
        if sender.text?.isEmpty == true {
            signInView.securityButton.isHidden = true
            signInView.removeButton.isHidden = true
            isPWTextFieldFull = false
            checkTextField()
        } else {
            signInView.securityButton.isHidden = false
            signInView.removeButton.isHidden = false
            isPWTextFieldFull = true
            checkTextField()
        }
    }
    
    @objc
    func tappedRemoveButton() {
        signInView.passwordTextField.text = ""
        signInView.securityButton.isHidden = true
        signInView.removeButton.isHidden = true
        isPWTextFieldFull = false
        checkTextField()
    }
    
    // FIXME: - isSecureTextEntry의 bool값이 한번 변경되고 나서 입력을 다시 진행하면, textfield의 값이 초기화되는데, 어떻게 해결하는지 모르겠음..
    
    @objc
    func tappedSecurityButton() {
        signInView.passwordTextField.isSecureTextEntry = !signInView.passwordTextField.isSecureTextEntry
    }
    
    /// 두 텍스트 필드 모두 차있으면, 로그인 버튼 활성화
    func checkTextField() {
        if isIDTextFieldFull && isPWTextFieldFull {
            signInView.loginButton.layer.borderColor = UIColor.primary.cgColor
            signInView.loginButton.backgroundColor = .primary
            signInView.loginButton.setTitleColor(.white, for: .normal)
            signInView.loginButton.isEnabled = true
        } else {
            signInView.loginButton.layer.borderColor = UIColor.gray4.cgColor
            signInView.loginButton.backgroundColor = .black
            signInView.loginButton.setTitleColor(.gray2, for: .normal)
            signInView.loginButton.isEnabled = false
        }
    }
    
    @objc
    func tappedLogInButton() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.setUserName(name: signInView.idTextField.text ?? "")
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}
