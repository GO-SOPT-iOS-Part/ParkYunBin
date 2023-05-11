//
//  Config.swift
//  SOPT_iOS_Week4
//
//  Created by 박윤빈 on 2023/05/06.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let APIKey = "API_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
    
    static let APIKey: String = {
        guard let key = Config.infoDictionary[Keys.Plist.APIKey] as? String else {
            fatalError("API Key is not set in plist for this configuration.")
        }
        return key
    }()
}
