//
//  NetworkResult.swift
//  SOPT_iOS_Week4
//
//  Created by 박윤빈 on 2023/05/06.
//

import Foundation

enum NetworkResult<T> {
    case success(T) // 서버 통신 성공
    case requestErr(T) // 요청 에러 발생
    case pathErr // 경로 에러
    case serverErr // 서버 내부 에러
    case networkErr // 네트워크 연결 실패
}
