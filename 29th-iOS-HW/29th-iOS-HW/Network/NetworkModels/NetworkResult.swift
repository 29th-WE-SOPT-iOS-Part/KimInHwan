//
//  NetworkResult.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/11/10.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
