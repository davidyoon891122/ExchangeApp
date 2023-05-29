//
//  APIKeys.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/07.
//

import Foundation

enum APIKeys {
    case koreaexim

    var key: String {
        switch self {
        case .koreaexim:
            return PlistManager.shared.getValueFromPlist(plistName: "apikey", key: "koreaexim")
        }
    }
}
