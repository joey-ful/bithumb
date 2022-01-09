//
//  ParsingError.swift
//  bithumb
//
//  Created by 김준건 on 2022/01/06.
//

import Foundation

enum ParsingError: LocalizedError {
    case dataConvertError
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .dataConvertError:
            return "Oops! Can't convert to Data type"
        case .decodingError:
            return "Oops! Can't decode"
        }
    }
}
