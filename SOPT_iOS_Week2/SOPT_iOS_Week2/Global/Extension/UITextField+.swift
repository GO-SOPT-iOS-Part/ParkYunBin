//
//  UITextField+.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/10.
//

import UIKit

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){ //왼쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
     
    func setRightPaddingPoints(_ amount:CGFloat) { //오른쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func addRightImage(image:UIImage) {
        let rightimage = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        rightimage.image = image
        self.rightView = rightimage
        self.rightViewMode = .always
    }
    
    func setPlaceholderColor(_ placeholderColor: UIColor) { //placeholder 색상 변경
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                       attributes: [.foregroundColor: placeholderColor,
                                                                    .font: font].compactMapValues { $0 }
            )
    }
}
