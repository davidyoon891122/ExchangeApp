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
    let price: Double
    let percent: Double
    let change: String
    let openingPrice: Double
    let highPrice: Double
    let lowPrice: Double
}
