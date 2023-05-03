//
//  SignInViewController.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/04.
//

import UIKit

import SnapKit

final class SignInViewController: UIViewController {
    
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

    private func configureUI() {
        view.addSubview(signInView)
    }
    
    private func setLayout() {
        signInView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // FIXME: - 한 textField 당 컨트롤 이벤트를 다르게 지정해서 액션 함수를 3개나 달아두는게 좋은 방법일까요?? 지양해야하는 방법이라면, 함수를 어떻게 수정할 수 있을까요..
    
    private func setActionEvent() {
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
    
    private func hideButtons() {
        signInView.securityButton.isHidden = true
        signInView.removeButton.isHidden = true
    }
    
    private func showButtons() {
        signInView.securityButton.isHidden = false
        signInView.removeButton.isHidden = false
    }
    
    /// 두 텍스트 필드 모두 차있으면, 로그인 버튼 활성화
    private func checkTextField() {
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
    private func startWriting(sender: UITextField) {
        sender.layer.borderColor = UIColor.gray2.cgColor
        if(sender == signInView.passwordTextField) {
            showButtons()
        }
    }
    
    @objc
    private func finishWriting(sender: UITextField) {
        sender.layer.borderColor = UIColor.clear.cgColor
        if(sender == signInView.passwordTextField) {
            hideButtons()
        }
    }
    
    @objc
    private func userWriteIDTextField(sender: UITextField) {
        if sender.text?.isEmpty == true {
            isIDTextFieldFull = false
        } else {
            isIDTextFieldFull = true
        }
        checkTextField()
    }
    
    @objc
    private func userWritePWTextField(sender: UITextField) {
        if sender.text?.isEmpty == true {
            hideButtons()
            isPWTextFieldFull = false
        } else {
            showButtons()
            isPWTextFieldFull = true
        }
        checkTextField()
    }
    
    // FIXME: - isSecureTextEntry의 bool값이 한번 변경되고 나서 입력을 다시 진행하면, textfield의 값이 초기화되는데, 어떻게 해결하는지 모르겠음..
    
    @objc
    private func tappedSecurityButton() {
        signInView.passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc
    private func tappedRemoveButton() {
        signInView.passwordTextField.text = ""
        hideButtons()
        isPWTextFieldFull = false
        checkTextField()
    }
    
    @objc
    private func tappedLogInButton() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.setUserName(name: signInView.idTextField.text ?? "")
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

