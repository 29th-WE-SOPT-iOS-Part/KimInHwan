//
//  LoginResponseDataModel.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/11/10.
//

import Foundation

// MARK: - SignResponseData
struct SignResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignResultData?
}

// MARK: - SignResultData
struct SignResultData: Codable {
    let id: Int
    let name, email: String
}
