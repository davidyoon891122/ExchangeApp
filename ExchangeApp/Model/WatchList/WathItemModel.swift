//
//  WathItemModel.swift
//  ExchangeApp
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
}
