//
//  DailyMovie.swift
//  SOPT_iOS_Week4
//
//  Created by 박윤빈 on 2023/05/11.
//

import Foundation

struct DailyMovieResponse: Codable {
    let page: Int
    let results: [Results]
    let dates: Rates
    let total_pages: Int
    let total_results: Int
}

struct Results: Codable {
    let poster_path: String?
    let adult: Bool
    let overview: String
    let release_date: String
    let genre_ids: [Int]
    let id: Int
    let original_title: String
    let original_language: String
    let title: String
    let backdrop_path: String?
    let popularity: Double
    let vote_count: Int
    let video: Bool
    let vote_average: Double
}

struct Rates: Codable {
    let maximum: String
    let minimum: String
}
