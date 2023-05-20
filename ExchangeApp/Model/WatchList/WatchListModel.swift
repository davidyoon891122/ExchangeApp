//
//  WatchListModel.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/20.
//

import Foundation

struct WatchListModel: Identifiable {
    let id = UUID()
    let code: String
}

var watchList: [WatchListModel] = []
