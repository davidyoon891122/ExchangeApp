//
//  UserDefaultsManager.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/22.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()

    private let userDefaults: UserDefaults

    init() {
        userDefaults = UserDefaults.standard
    }

    func loadData() -> [WatchListModel] {
        guard let data = userDefaults.object(forKey: "InterestItem") as? Data,
              let watchListData = try? PropertyListDecoder().decode([WatchListModel].self, from: data) else {
            return []
        }

        return watchListData
    }

    func saveData(items: [WatchListModel]) {
        let encodedData = try? PropertyListEncoder().encode(items)
        userDefaults.set(encodedData, forKey: "InterestItem")
    }
}
