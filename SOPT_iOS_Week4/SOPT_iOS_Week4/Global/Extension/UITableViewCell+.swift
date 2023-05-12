//
//  UITableViewCell+.swift
//  SOPT_iOS_Week4
//
//  Created by 박윤빈 on 2023/05/11.
//

import UIKit

extension UITableViewCell{
    
    static var cellIdentifier : String {
        return String(describing: self)
    }
}
