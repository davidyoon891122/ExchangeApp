//
//  CoinMarketStore.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import Foundation

func fetchCoinMarket() async throws -> [CoinMarketModel] {
    let url = URL(string: "https://api.upbit.com/v1/market/all")

    let (data, response) = try await URLSession.shared.data(from: url!)

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw NetworkError.responseError
    }

    guard let data = try? JSONDecoder().decode([CoinMarketModel].self, from: data) else {
        throw NetworkError.decodingError
    }

    return data
}

class CoinMarketStore: ObservableObject {
    @Published var coinMarketData = coinMarketList
    @Published var filteredCoinlist: [CoinMarketModel] = []
    var krwList: [CoinMarketModel] = []
    var btcList: [CoinMarketModel] = []
    var usdtList: [CoinMarketModel] = []
    var currentPaymentType: PaymentType = .krw

    init() {
        refreshView()
    }

    func refreshView() {
        coinMarketData = []
        Task {
            do {
                let data = try await fetchCoinMarket()
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.coinMarketData = data
                    coinMarketData.forEach {
                        if $0.market.contains("KRW-") {
                            self.krwList.append($0)
                        } else if $0.market.contains("BTC-") {
                            self.btcList.append($0)
                        } else {
                            self.usdtList.append($0)
                        }
                    }
                    self.filteredCoinlist = self.krwList
                }
            } catch {
                print(error)
            }
        }
    }

    func searchItem(item: String) {
        switch currentPaymentType {
        case .krw:
            filteredCoinlist = krwList
        case .btc:
            filteredCoinlist = btcList
        case .usdt:
            filteredCoinlist = usdtList
        }
        if !item.isEmpty {
            let result = filteredCoinlist.filter {
                $0.market.uppercased().contains(item.uppercased())
                || $0.english_name.uppercased().contains(item.uppercased())
            }
            filteredCoinlist = result
        }
    }

    func getCoinListByPaymentType(paymentType: PaymentType) {
        currentPaymentType = paymentType
        switch paymentType {
        case .krw:
            filteredCoinlist = krwList
        case .btc:
            filteredCoinlist = btcList
        case .usdt:
            filteredCoinlist = usdtList
        }
    }
}

enum PaymentType: String {
    case krw = "KRW"
    case btc = "BTC"
    case usdt = "USDT"
}
