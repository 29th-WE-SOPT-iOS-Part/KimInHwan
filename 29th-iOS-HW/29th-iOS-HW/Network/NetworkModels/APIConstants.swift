//
//  APIConstants.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/11/10.
//

import Foundation

struct APIConstants {
    //MARK: Base URL
    static let baseURL: String = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    //MARK: Feature URL
    static let logInURL: String = baseURL + "/user/login"
    static let signUpURL: String = baseURL + "/user/signup"
}
