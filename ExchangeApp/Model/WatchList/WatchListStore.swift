//
//  WatchListStore.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/20.
//

import Foundation

func fetchWatchList() -> [WatchListModel] {
    let interesetData = UserDefaultsManager.shared.loadData()

    return interesetData
}

func fetchTicker(codes: [String]) async throws -> [CoinTickerModel] {
    let joinedCodes = codes.joined(separator: ",")

    print(joinedCodes)
    let url = URL(string: "https://api.upbit.com/v1/ticker?markets=\(joinedCodes)")

    let (data, response) = try await URLSession.shared.data(from: url!)

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw NetworkError.responseError
    }

    guard let data = try? JSONDecoder().decode([CoinTickerModel].self, from: data) else {
        throw NetworkError.decodingError
    }

    return data
}

class WatchListStore: ObservableObject {
    var watchListData = watchList
    @Published var coinTickerData: [CoinTickerModel] = []

    init() {
        loadWatchList()
    }

    func loadWatchList() {
        watchListData = fetchWatchList()
        refreshView()
    }

    func refreshView() {
        Task {
            do {
                let result = watchListData.map {
                    $0.code
                }
                
                let tickers = try await fetchTicker(codes: result)
                DispatchQueue.main.async {
                    self.coinTickerData = tickers
                }
            } catch {
                print(error)
            }
        }
    }

    func addItemToWatchList(code: String) {
        let watchListModel = WatchListModel(code: code)
        watchListData.append(watchListModel)
        UserDefaultsManager.shared.saveData(items: watchListData)
    }

    func removeItemFromWatchList(code: String) {
        watchListData = watchListData.filter {
            $0.code != code
        }
        UserDefaultsManager.shared.saveData(items: watchListData)
    }

    func isLikeItem(code: String) -> Bool {
        var result = false
        watchListData.forEach {
            if $0.code == code {
                result = true
            }
        }
        return result
    }
}
