//
//  Extension+Double.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/29.
//

import Foundation

extension Double {
    func setPricesByPaymentType(type: String) -> String {
        if type.contains("BTC-") {
            return String(format: "%.8f", self)
        } else if type.contains("USDT-") {
            return String(format: "%.3f", self)
        } else {
            return String(format: "%.f", self)
        }
    }
}
