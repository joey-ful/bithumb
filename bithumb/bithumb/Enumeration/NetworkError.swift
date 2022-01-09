//
//  NetworkError.swift
//  bithumb
//
//  Created by 김준건 on 2022/01/06.
//

import Foundation

enum NetworkError: LocalizedError {
    case badResponse
    case invalidData
    case invalidURL
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badResponse:
            return "Oops! This is not a valid HTTP Response"
        case .invalidData:
            return "Oops! Couldn't get data"
        case .invalidURL:
            return "Oops! This is not a valid URL"
        case .unknown:
            return "알수 없는 오류 발생"
        }
    }
}
