//
//  CoinChartModel.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/06/10.
//

import Foundation

struct CoinChartModel: Decodable, Identifiable {
    let id = UUID()
    let market: String
    let candle_date_time_utc: String
    let candle_date_time_kst: String
    let opening_price: Double
    let high_price: Double
    let low_price: Double
    let trade_price: Double
    let timestamp: Int
    let candle_acc_trade_price: Double
    let candle_acc_trade_volume: Double
    let unit: Int?
    let first_day_of_period: String?
}

extension CoinChartModel {
    static let coinChartData: [CoinChartModel] = []
}


struct CoinChartCommonModel: Identifiable {
    var id: UUID
    let market: String
    let candle_date_time_utc: String
    let candle_date_time_kst: String
    let opening_price: Double
    let high_price: Double
    let low_price: Double
    let trade_price: Double
    let timestamp: Int
    let candle_acc_trade_price: Double
    let candle_acc_trade_volume: Double
    let date: String
}
