//
//  WatchListStore.swift
//  TradingApp
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
    @Published var watchItemData: [WatchItemModel] = []

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

                let watchItems = tickers.map {
                    WatchItemModel(
                        id: $0.id,
                        iconImageName: "bitcoin",
                        itemName: $0.market,
                        itemCode: $0.market,
                        price: $0.tradePrice,
                        percent: (($0.tradePrice - $0.prevClosingPrice) * 100) / $0.prevClosingPrice,
                        change: $0.change,
                        openingPrice: $0.openingPrice,
                        highPrice: $0.highPrice,
                        lowPrice: $0.lowPrice
                    )
                }

                DispatchQueue.main.async {
                    self.watchItemData = watchItems
                }
            } catch {
                print(error)
            }
        }
    }

    func addItemToWatchList(item: CoinMarketModel) {

        watchListData.append(WatchListModel(code: item.market, engName: item.english_name))
        UserDefaultsManager.shared.saveData(items: watchListData)
    }

    func removeItemFromWatchList(item: CoinMarketModel) {
        watchListData = watchListData.filter {
            $0.code != item.market
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
