//
//  CoinMarketStore.swift
//  ExchangeApp
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

    init() {
        refreshView()
    }

    func refreshView() {
        coinMarketData = []
        print("호출")
        Task {
            do {
                let data = try await fetchCoinMarket()
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.coinMarketData = data
                }
            } catch {
                print(error)
            }
        }
    }
}
