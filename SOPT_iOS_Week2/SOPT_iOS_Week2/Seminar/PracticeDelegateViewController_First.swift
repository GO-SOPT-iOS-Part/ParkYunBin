//
//  FirstPracticeViewController.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/08.
//

import UIKit

import SnapKit
import Then

final class PracticeDelegateViewController: UIViewController {
    
    private lazy var resultLabel = UILabel().then {
        $0.text = "조금 더 눌라바.."
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private lazy var nextButton = UIButton().then {
        $0.setTitle("다음으로!", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .blue
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponent()
        setLayout()
        setButtonEvent()
    }
}

extension PracticeDelegateViewController {
    
    func addComponent() {
        [resultLabel, nextButton].forEach{
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        view.backgroundColor = .systemBackground
        
        resultLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(10)
            make.centerX.equalTo(resultLabel)
        }
    }
    
    func setButtonEvent() {
        nextButton.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
    }
    
    @objc
    func tappedNextButton() {
        let secondViewController = SecondPracticeViewController()
        secondViewController.modalPresentationStyle = .formSheet
        secondViewController.delegate = self
        self.present(secondViewController, animated: true)
    }
}

extension PracticeDelegateViewController: DataBindProtocol {
    func dataBind(count: Int) {
        resultLabel.text = "조금 더 눌러바 ... \(String(count))"
    }
}
