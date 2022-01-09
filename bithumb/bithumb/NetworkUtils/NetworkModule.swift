//
//  NetworkModule.swift
//  bithumb
//
//  Created by 김준건 on 2022/01/06.
//

import Foundation

struct NetworkModule: Networkable {
    private var dataTask: URLSessionDataTask?
    private let rangeOfSuccessState = 200...299

    mutating func runDataTask( request: URLRequest, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        dataTask?.cancel()
        dataTask = nil
        
        dataTask = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            if let response = response as? HTTPURLResponse,
               rangeOfSuccessState.contains(response.statusCode),
               let data = data {
                DispatchQueue.main.async {
                    completionHandler(.success(data))
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(.failure(NetworkError.unknown))
                }
            }
        }
        dataTask?.resume()
    }
}
