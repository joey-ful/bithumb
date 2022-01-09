//
//  Ticker.swift
//  bithumb
//
//  Created by 김준건 on 2022/01/06.
//

import Foundation

struct Ticker: Decodable {
    let status: String
    let data: TickerData
    
    struct TickerData: Decodable {
        let openingPrice: String
        let closingPrice: String
        let maxPrice: String
        let minPrice: String
        let untilsTraded: String
        let accTradeValue: String
        let prevClosingPrice: String
        let untilsTraded24H: String
        let accTradeValue24H: String
        let fluectate24H: String
        let fluectateRate24H: String
        let date: String
        
        
        enum CodingKeys: String, CodingKey {
            case openingPrice = "opening_price"
            case closingPrice = "closing_price"
            case maxPrice = "max_price"
            case minPrice = "min_price"
            case untilsTraded = "units_traded"
            case accTradeValue = "acc_trade_value"
            case prevClosingPrice = "prev_closing_price"
            case untilsTraded24H = "units_traded_24H"
            case accTradeValue24H = "acc_trade_value_24H"
            case fluectate24H = "fluctate_24H"
            case fluectateRate24H = "fluctate_rate_24H"
            case date
        }
    }
}
