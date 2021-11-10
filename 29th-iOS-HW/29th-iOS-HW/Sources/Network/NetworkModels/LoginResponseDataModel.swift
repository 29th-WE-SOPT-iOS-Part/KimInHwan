//
//  LoginResponseDataModel.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/11/10.
//

import Foundation

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - LoginResultData
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
