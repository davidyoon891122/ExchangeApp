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
                if watchListData.isEmpty {
                    DispatchQueue.main.async {
                        self.watchItemData = []
                    }
                } else {
                    let result = watchListData.map {
                        $0.code
                    }

                    let tickers = try await fetchTicker(codes: result)

                    let watchItems = await createWatchItems(items: tickers)

                    DispatchQueue.main.async {
                        self.watchItemData = watchItems
                    }
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

    func createWatchItems(items: [CoinTickerModel]) async -> [WatchItemModel] {
        var watchItems: [WatchItemModel] = []

        for index in 0...items.count-1 {
            watchItems.append(
                WatchItemModel(
                    id: items[index].id,
                    iconImageName: "bitcoin",
                    itemName: self.watchListData[index].engName,
                    itemCode: items[index].market,
                    tradeDate: items[index].tradeDate,
                    tradeDateKst: items[index].tradeDateKst,
                    tradeTimeKst: items[index].tradeTimeKst,
                    tradeTimestamp: items[index].tradeTimestamp,
                    price: items[index].tradePrice,
                    percent: ((items[index].tradePrice - items[index].prevClosingPrice) * 100) / items[index].prevClosingPrice,
                    change: items[index].change,
                    openingPrice: items[index].openingPrice,
                    highPrice: items[index].highPrice,
                    lowPrice: items[index].lowPrice,
                    prevClosingPrice: items[index].prevClosingPrice,
                    changePrice: items[index].changePrice,
                    changeRate: items[index].changeRate,
                    signedChangePrice: items[index].signedChangePrice,
                    signedChangeRate: items[index].signedChangeRate,
                    tradeVolume: items[index].tradeVolume,
                    accTradePrice: items[index].accTradePrice,
                    accTradePrice24h: items[index].accTradePrice24h,
                    accTradeVolume: items[index].accTradeVolume,
                    accTradeVolume24h: items[index].accTradeVolume24h,
                    highest52WeekPrice: items[index].highest52WeekPrice,
                    highest52WeekDate: items[index].highest52WeekDate,
                    lowest52WeekPrice: items[index].lowest52WeekPrice,
                    lowest52WeekDate: items[index].lowest52WeekDate,
                    timestamp: items[index].timestamp
                )
            )
        }

        return watchItems
    }
}
