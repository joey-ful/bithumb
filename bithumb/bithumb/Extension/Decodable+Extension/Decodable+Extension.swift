//
//  Decodable+Extension.swift
//  bithumb
//
//  Created by 김준건 on 2022/01/06.
//

import Foundation

extension Decodable {
    func parse<T: Decodable>(to destinationType: T.Type) -> Result<T, ParsingError> {
        let jsonDecoder = JSONDecoder()
        
        guard let data = self as? Data else {
            return .failure(.dataConvertError)
        }
        
        guard let decodedData = try? jsonDecoder.decode(destinationType, from: data) else {
            return .failure(.decodingError)
        }
        
        return .success(decodedData)
    }
}
