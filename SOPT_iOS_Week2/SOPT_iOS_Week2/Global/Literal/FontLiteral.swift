//
//  FontLiteral.swift
//  SOPT_iOS_Week2
//
//  Created by 박윤빈 on 2023/04/12.
//

import UIKit

enum AppFontName: String {

    case regularFont = "Pretendard-Regular"
    case mediumFont = "Pretendard-Medium"
    case semiBoldFont = "Pretendard-SemiBold"
    case boldFont = "Pretendard-Bold"

    var name: String {
        return self.rawValue
    }
}
