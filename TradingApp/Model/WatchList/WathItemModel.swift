//
//  WathItemModel.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/29.
//

import Foundation

struct WatchItemModel: Identifiable {
    let id: UUID
    let iconImageName: String
    let itemName: String
    let itemCode: String
    let tradeDate: String
    let tradeDateKst: String // trade_date_kst
    let tradeTimeKst: String // trade_time_kst
    let tradeTimestamp: Double // trade_timestamp
    let price: Double
    let percent: Double
    let change: String
    let openingPrice: Double
    let highPrice: Double
    let lowPrice: Double
    let prevClosingPrice: Double // prev_closing_price
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
}
