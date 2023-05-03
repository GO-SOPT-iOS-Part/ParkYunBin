//
//  UIColor+.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/04.
//

import UIKit

extension UIColor {
    
    static var primary: UIColor {
        return UIColor(hex: "#FF143C")
    }
    
    static var gray4: UIColor {
        return UIColor(hex: "#2E2E2E")
    }
    
    static var gray3: UIColor {
        return UIColor(hex: "#626262")
    }
    
    static var gray2: UIColor {
        return UIColor(hex: "#9C9C9C")
    }
    
    static var gray1: UIColor {
        return UIColor(hex: "#D6D6D6")
    }
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}


