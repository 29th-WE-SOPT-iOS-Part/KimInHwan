//
//  UserSignService.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/11/10.
//

import Alamofire
import UIKit

// 유저의 회원가입 및 로그인 관련 서비스
struct UserSignService {
    static let shared = UserSignService()
    
    func signUp(email: String,
                password: String,
                name: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.signUpURL
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "name": name,
            "password": password,
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success(_):
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let networkResult = self.judgeSignStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
            
        }
    }
    
    func logIn(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.logInURL
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success(_):
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let networkResult = self.judgeSignStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
            
        }
    }
    
    private func judgeSignStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return isValidSignData(data: data)
        case 400:
            return isClientErrorData(data: data)
        case 404:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func isValidSignData(data: Data) -> NetworkResult<Any> {
        let decoder: JSONDecoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignResponseData.self, from: data) else { return .pathErr }
        return .success(decodedData)
    }
    
    private func isClientErrorData(data: Data) -> NetworkResult<Any> {
        let decoder: JSONDecoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignResponseData.self, from: data) else { return .pathErr }
        return .requestErr(decodedData)
    }
    
}
