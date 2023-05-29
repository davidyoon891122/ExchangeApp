//
//  CoinMarketModel.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import Foundation

struct CoinMarketModel: Decodable, Identifiable {
    let id = UUID()
    let market: String
    let korean_name: String
    let english_name: String
}

var coinMarketList: [CoinMarketModel] = []
