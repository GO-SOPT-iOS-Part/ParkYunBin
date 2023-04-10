//
//  PracticeLayoutViewController.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/08.
//

import UIKit

import SnapKit

class PracticeLayoutViewController: UIViewController {
    
    private let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private let thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let fourthView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addComponent()
        setLayout()
    }
}

extension PracticeLayoutViewController {
    
    func addComponent() {
        [firstView, secondView, thirdView, fourthView].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        
        view.backgroundColor = .systemBackground
        
        firstView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
            make.trailing.equalTo(view.snp.centerX)
        }
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom)
            make.leading.equalTo(firstView.snp.trailing)
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        thirdView.snp.makeConstraints { make in
            make.top.equalTo(secondView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalTo(firstView)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        fourthView.snp.makeConstraints { make in
            make.top.equalTo(thirdView.snp.bottom)
            make.leading.equalTo(thirdView.snp.trailing)
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
    }
}
