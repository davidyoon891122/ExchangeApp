//
//  ExchangeStore.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/01.
//

import UIKit

enum NetworkError: Error {
    case responseError
    case decodingError
}

func fetchExchangeAPI() async throws -> [ExchangeModel] {
    let apiKey = APIKeys.koreaexim.key

    let url = URL(string: "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=\(apiKey)&searchdate=20230420&data=AP01")

    let (data, response) = try await URLSession.shared.data(from: url!)

    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
        throw NetworkError.responseError
    }

    guard let data = try? JSONDecoder().decode([ExchangeModel].self, from: data) else {
        throw NetworkError.decodingError
    }

    return data
}

class ExchangeStore: ObservableObject {
    @Published var exchangeData: [ExchangeModel] = exchangeList

    init() {
        self.refreshView()
    }

    func refreshView() {
        exchangeData = []
        Task {
            do {
                let data = try await fetchExchangeAPI()
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.exchangeData = data
                }
            } catch {
                print(error)
            }
        }
    }
}

