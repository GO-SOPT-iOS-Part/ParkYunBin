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
    
    // FIXME: - 한 textField 당 컨트롤 이벤트를 다르게 지정해서 액션 함수를 3개나 달아두는게 좋은 방법일까요??
    
    func setActionEvent() {
        signInView.idTextField.addTarget(self, action: #selector(userWriteIDTextField), for: .editingChanged)
        signInView.idTextField.addTarget(self, action: #selector(finishWriting), for: .editingDidEnd)
        signInView.idTextField.addTarget(self, action: #selector(startWriting), for: .editingDidBegin)
        signInView.passwordTextField.addTarget(self, action: #selector(userWritePWTextField), for: .editingChanged)
        signInView.passwordTextField.addTarget(self, action: #selector(finishWriting), for: .editingDidEnd)
        signInView.passwordTextField.addTarget(self, action: #selector(startWriting), for: .editingDidBegin)
        signInView.removeButton.addTarget(self, action: #selector(tappedRemoveButton), for: .touchUpInside)
        signInView.securityButton.addTarget(self, action: #selector(tappedSecurityButton), for: .touchUpInside)
        signInView.loginButton.addTarget(self, action: #selector(tappedLogInButton), for: .touchUpInside)
    }
    
    func hideButtons() {
        signInView.securityButton.isHidden = true
        signInView.removeButton.isHidden = true
    }
    
    func showButtons() {
        signInView.securityButton.isHidden = false
        signInView.removeButton.isHidden = false
    }
    
    @objc
    func startWriting(sender: UITextField) {
        sender.layer.borderColor = UIColor.gray2.cgColor
    }
    
    @objc
    func finishWriting(sender: UITextField) {
        sender.layer.borderColor = UIColor.clear.cgColor
        if(sender == signInView.passwordTextField) {
            hideButtons()
        }
    }
    
    @objc
    func userWriteIDTextField(sender: UITextField) {
        if sender.text?.isEmpty == true {
            isIDTextFieldFull = false
            checkTextField()
        } else {
            isIDTextFieldFull = true
            checkTextField()
        }
    }
    
    @objc
    func userWritePWTextField(sender: UITextField) {
        if sender.text?.isEmpty == true {
            hideButtons()
            isPWTextFieldFull = false
            checkTextField()
        } else {
            showButtons()
            isPWTextFieldFull = true
            checkTextField()
        }
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
    func tappedRemoveButton() {
        signInView.passwordTextField.text = ""
        hideButtons()
        isPWTextFieldFull = false
        checkTextField()
    }
    
    @objc
    func tappedLogInButton() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.setUserName(name: signInView.idTextField.text ?? "")
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}
