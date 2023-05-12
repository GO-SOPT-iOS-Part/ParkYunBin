//
//  UIVIew+.swift
//  SOPT_iOS_Week4
//
//  Created by 박윤빈 on 2023/05/11.
//

import UIKit.UIView

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
