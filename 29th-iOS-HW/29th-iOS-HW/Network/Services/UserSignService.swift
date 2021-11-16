//
//  UserSignService.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/11/10.
//
import UIKit
import Alamofire

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
        
        dataRequest(requestURL: url, headers: header, requestBody: body, completion: completion)
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
        
        dataRequest(requestURL: url, headers: header, requestBody: body, completion: completion)
    }
    
    private func dataRequest(requestURL: String, headers: HTTPHeaders, requestBody: Parameters, completion: @escaping (NetworkResult<Any>) -> Void) {
        let dataRequest = AF.request(requestURL, method: .post, parameters: requestBody, encoding: JSONEncoding.default, headers: headers)
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
            return isValidSignData(data: data, state: .succeed)
        case 400:
            return isValidSignData(data: data, state: .err)
        case 404:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func isValidSignData(data: Data, state: ValidState) -> NetworkResult<Any> {
        let decoder: JSONDecoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignResponseData.self, from: data) else { return .pathErr }
        switch state {
        case .succeed: return .success(decodedData)
        case .err: return .requestErr(decodedData)
        }
    }
    
}

private enum ValidState {
    case succeed
    case err
}
