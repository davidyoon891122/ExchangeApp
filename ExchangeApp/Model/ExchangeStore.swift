//
//  ExchangeStore.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/01.
//

import Foundation

class ExchangeStore: ObservableObject {
    @Published var exchangeData: [ExchangeModel] = exchangeList
}

