//
//  DataTaskRequsetable.swift
//  bithumb
//
//  Created by 김준건 on 2022/01/06.
//

import Foundation

protocol Networkable {
    mutating func runDataTask(request: URLRequest, completionHandler: @escaping (Result<Data,Error>) -> Void)
}

