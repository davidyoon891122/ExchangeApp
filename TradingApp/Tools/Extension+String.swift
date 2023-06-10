//
//  Extension+String.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/06/10.
//

import Foundation

extension String {
    func convertStringToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
}
