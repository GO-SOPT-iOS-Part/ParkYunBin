//
//  SignInViewController.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/10.
//

import UIKit

import SnapKit

class SignInViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var signInView = SignInView()
    
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
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
}
