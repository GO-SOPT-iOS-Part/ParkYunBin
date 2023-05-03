//
//  UIView+.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/10.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
