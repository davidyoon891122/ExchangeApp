//
//  WatchListModel.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/20.
//

import Foundation

struct WatchListModel: Codable, Identifiable {
    var id = UUID()
    let code: String
    let engName: String
}

var watchList: [WatchListModel] = []
