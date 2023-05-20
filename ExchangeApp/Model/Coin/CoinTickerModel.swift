//
//  CoinTickerModel.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/20.
//

import Foundation

struct CoinTickerModel: Decodable, Identifiable {
    let id = UUID()
    let market: String
    let tradeDate: String // trade_date
    let tradeTime: String // trade_time
    let tradeDateKst: String // trade_date_kst
    let tradeTimeKst: String // trade_time_kst
    let tradeTimestamp: Double // trade_timestamp
    let openingPrice: Double // opening_price
    let highPrice: Double // high_price
    let lowPrice: Double // low_price
    let tradePrice: Double // trade_price
    let prevClosingPrice: Double // prev_closing_price
    let change: String // change
    let changePrice: Double // change_price
    let changeRate: Double // change_rate
    let signedChangePrice: Double // signed_change_price
    let signedChangeRate: Double // signed_change_rate
    let tradeVolume: Double // trade_volume
    let accTradePrice: Double // acc_trade_price
    let accTradePrice24h: Double // acc_trade_price_24h
    let accTradeVolume: Double // acc_trade_volume
    let accTradeVolume24h: Double // acc_trade_volume_24h
    let highest52WeekPrice: Double // highest_52_week_price
    let highest52WeekDate: String // highest_52_week_date
    let lowest52WeekPrice: Double // lowest_52_week_price
    let lowest52WeekDate: String // lowest_52_week_date
    let timestamp: Int // timestamp

    enum CodingKeys: String, CodingKey {
        case market, change, timestamp
        case tradeDate = "trade_date"
        case tradeTime = "trade_time"
        case tradeDateKst = "trade_date_kst"
        case tradeTimeKst = "trade_time_kst"
        case tradeTimestamp = "trade_timestamp"
        case openingPrice = "opening_price"
        case highPrice = "high_price"
        case lowPrice = "low_price"
        case tradePrice = "trade_price"
        case prevClosingPrice = "prev_closing_price"
        case changePrice = "change_price"
        case changeRate = "change_rate"
        case signedChangePrice = "signed_change_price"
        case signedChangeRate = "signed_change_rate"
        case tradeVolume = "trade_volume"
        case accTradePrice = "acc_trade_price"
        case accTradePrice24h = "acc_trade_price_24h"
        case accTradeVolume = "acc_trade_volume"
        case accTradeVolume24h = "acc_trade_volume_24h"
        case highest52WeekPrice = "highest_52_week_price"
        case highest52WeekDate = "highest_52_week_date"
        case lowest52WeekPrice = "lowest_52_week_price"
        case lowest52WeekDate = "lowest_52_week_date"
    }
}
