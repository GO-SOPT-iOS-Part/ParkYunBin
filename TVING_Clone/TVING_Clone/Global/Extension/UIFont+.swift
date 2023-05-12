//
//  UIFont+.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/04.
//

import UIKit

extension UIFont {
    
        class func regular(size: CGFloat) -> UIFont {
            return UIFont(name: AppFontName.regularFont.rawValue, size: size)!
        }
    
        class func medium(size: CGFloat) -> UIFont {
            return UIFont(name: AppFontName.mediumFont.rawValue, size: size)!
        }
    
        class func semiBold(size: CGFloat) -> UIFont {
            return UIFont(name: AppFontName.semiBoldFont.rawValue, size: size)!
        }
    
        class func bold(size: CGFloat) -> UIFont {
            return UIFont(name: AppFontName.boldFont.rawValue, size: size)!
        }
}
