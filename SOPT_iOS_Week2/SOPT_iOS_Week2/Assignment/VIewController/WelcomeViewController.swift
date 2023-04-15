//
//  WelcomeViewController.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/15.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "WecomeView"
        setNavigationBar()
    }
    
    func setNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }

}
