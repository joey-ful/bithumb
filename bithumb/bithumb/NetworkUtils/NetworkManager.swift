//
//  NetworkManager.swift
//  bithumb
//
//  Created by 김준건 on 2022/01/06.
//

import Foundation

struct NetworkManager {
    private var networkable: Networkable
    
    init(networkable: Networkable = NetworkModule()) {
        self.networkable = networkable
    }
    
    mutating func request(with route: URLRequest,
                          queryItems: [URLQueryItem]?,
                          header: [String: String]? = nil,
                          bodyParameters: [String: Any]? = nil,
                          httpMethod: HTTPMethod,
                          requestType: URLRequestTask,
                          completionHandler: @escaping (Result<Data, Error>) -> Void)
    {
        
//        guard let urlRequest = requestType.buildRequest(route: route,
//                                                        queryItems: queryItems,
//                                                        header: header,
//                                                        bodyParameters: bodyParameters,
//                                                        httpMethod: httpMethod)
//        else {
//            completionHandler(.failure(NetworkError.invalidURL))
//            return
//        }
        networkable.runDataTask(request: route, completionHandler: completionHandler)
    }
}
