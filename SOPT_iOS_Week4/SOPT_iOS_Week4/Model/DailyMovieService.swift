//
//  SignUpService.swift
//  SOPT_iOS_Week4
//
//  Created by 박윤빈 on 2023/05/06.
//

import Foundation

import Alamofire

final class DailyMovieService {
    
    static let shared = DailyMovieService()
    
    private init() {}
    
    func dailyMovie(completion: @escaping(NetworkResult<Any>) -> Void) {
        let url = Config.baseURL + "/movie/now_playing?api_key=" + Config.APIKey
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(url, method: .get, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 401, 404: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(DailyMovieResponse.self, from: data) else { return .pathErr }
        
        return .success(decodedData as Any)
    }
    
    
}
