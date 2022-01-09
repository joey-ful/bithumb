//
//  ParsingManager.swift
//  bithumb
//
//  Created by 김준건 on 2022/01/07.
//

import UIKit

struct ParsingManager {
    private let jsonDecoder = JSONDecoder()
    
    func decode<T: Decodable>(from source: Data, to destinationType: T.Type) -> Result<T, ParsingError> {
        guard let decodedData = try? jsonDecoder.decode(destinationType, from: source) else {
            return .failure(.decodingError)
        }
        return .success(decodedData)
    }
    
    func decode<T: Decodable>(from fileName: String, to destinationType: T.Type) -> Result<T, ParsingError> {
        guard let asset = NSDataAsset(name: fileName) else {
            return .failure(.dataConvertError)
        }
        guard let decodedData = try? jsonDecoder.decode(destinationType, from: asset.data) else {
            return .failure(.decodingError)
        }
        return .success(decodedData)
    }
}
