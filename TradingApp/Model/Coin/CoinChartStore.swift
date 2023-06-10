//
//  CoinChartStore.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/06/10.
//

import Foundation
import Combine

func fetchCoinMinuteChart(code: String, count: String, minutes: String) async throws -> [CoinChartModel] {

    let url = URL(string: "https://api.upbit.com/v1/candles/minutes/\(minutes)?market=\(code)&count=\(count)")!

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
        throw NetworkError.responseError
    }

    do {
        let data = try JSONDecoder().decode([CoinChartModel].self, from: data)
        return data
    } catch {
        print(error)
        throw NetworkError.decodingError
    }
}

func fetchCoinMonthChart(code: String, count: String) async throws -> [CoinChartModel] {

    let url = URL(string: "https://api.upbit.com/v1/candles/months?market=\(code)&count=\(count)")!

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
        throw NetworkError.responseError
    }

    do {
        let data = try JSONDecoder().decode([CoinChartModel].self, from: data)
        return data
    } catch {
        print(error)
        throw NetworkError.decodingError
    }
}

enum ChartType {
    case minute
    case day
    case week
    case month
}

class CoinChartStore: ObservableObject {
    @Published var coinChartData: [CoinChartModel] = []

    private var code: String
    private var count: String
    private var minutes: String?
    private var chartType: ChartType

    init(code: String, count: String, chartType: ChartType, minutes: String?) {
        self.code = code
        self.count = count
        self.minutes = minutes
        self.chartType = chartType

        refreshView()
    }

    func refreshView() {
        Task {
            do {
                switch chartType {
                case .minute:
                    if let minutes = self.minutes {
                        let data = try await fetchCoinMinuteChart(code: code, count: count, minutes: minutes)
                        DispatchQueue.main.async {
                            [weak self] in
                            guard let self = self else { return }
                            self.coinChartData = data
                        }
                    }
                case .day:
                    let data = try await fetchCoinMonthChart(code: code, count: count)
                case .week:
                    let data = try await fetchCoinMonthChart(code: code, count: count)
                case .month:
                    let data = try await fetchCoinMonthChart(code: code, count: count)
                    DispatchQueue.main.async {
                        [weak self] in
                        guard let self = self else { return }
                        self.coinChartData = data.reversed()
                    }
                }


            } catch {
                print(error)
            }
        }
    }

    func calculateMinMax(data: [CoinChartModel]) {

    }
}
