//
//  ViewController.swift
//  bithumb
//
//  Created by 김준건 on 2022/01/06.
//

import UIKit

class ViewController: UIViewController {
    private var networkManager = NetworkManager()
    private var parsingManager = ParsingManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://api.bithumb.com/public/ticker/ALL_KRW") else {
            return
        }
        let urlRequset = URLRequest(url: url)
        networkManager.request(with: urlRequset, queryItems: nil,httpMethod: .get, requestType: .requestWithQueryItems) { result in
            switch result {
            case .success(let data):
                dump(data)
                let parsedData = self.parsingManager.decode(from: data, to: Ticker.self)
                switch parsedData {
                case .success(let tickerData):
                    print(tickerData)
                case .failure(let error):
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
        }

    }
    
}
