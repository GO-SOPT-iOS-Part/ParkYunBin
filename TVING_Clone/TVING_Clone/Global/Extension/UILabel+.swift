//
//  UILabel+.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/05.
//

import UIKit.UILabel

extension UILabel {
        func labelWithImg(composition: NSAttributedString...) {
            let attributedString = NSMutableAttributedString()
            for i in composition {
            attributedString.append(i)
            }
        self.attributedText = attributedString
    }
}
