//
//  MyPage.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/04.
//

import UIKit

struct MyPage {
    let service: String
    let buttonImage: UIImage
}

extension MyPage {
    static func firstSectionDummy() -> [MyPage] {
        return [MyPage(service: "이용권",
                       buttonImage: .arrow),
                MyPage(service: "1:1 문의내역",
                       buttonImage: .arrow),
                MyPage(service: "예약알림",
                       buttonImage: .arrow),
                MyPage(service: "회원정보 수정",
                       buttonImage: .arrow),
                MyPage(service: "프로모션 정보 수신 동의",
                       buttonImage: .arrow)]
    }
    
    static func secondSectionDummy() -> [MyPage] {
        return [MyPage(service: "공지사항",
                       buttonImage: .arrow),
                MyPage(service: "이벤트",
                       buttonImage: .arrow),
                MyPage(service: "고객센터",
                       buttonImage: .arrow),
                MyPage(service: "티빙 알아보기",
                       buttonImage: .arrow)]
    }
}
