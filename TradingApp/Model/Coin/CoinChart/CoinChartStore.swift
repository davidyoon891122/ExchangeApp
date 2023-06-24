//
//  CoinChartStore.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/06/10.
//

import Foundation
import Combine

func fetchCoinMinuteChart(code: String, count: Int, minutes: String) async throws -> [CoinChartModel] {

    let url = URL(string: "https://api.upbit.com/v1/candles/minutes/\(minutes)?market=\(code)&count=\(count + 1)")!

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

func fetchCoinChart(code: String, count: Int, type: ChartType) async throws -> [CoinChartModel] {
    var url: URL

    switch type {
    case .minute:
        url = URL(string: "https://api.upbit.com/v1/candles/minutes/5?market=\(code)&count=\(count + 1)")!
    case .day:
        url = URL(string: "https://api.upbit.com/v1/candles/days?market=\(code)&count=\(count + 1)")!
    case .week:
        url = URL(string: "https://api.upbit.com/v1/candles/weeks?market=\(code)&count=\(count + 1)")!
    case .month:
        url = URL(string: "https://api.upbit.com/v1/candles/months?market=\(code)&count=\(count + 1)")!
    }

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


enum ChartType: String, CaseIterable {
    case minute = "Minute"
    case day = "Day"
    case week = "Week"
    case month = "Month"
}

class CoinChartStore: ObservableObject {
    @Published var coinChartCommonData: [CoinChartCommonModel] = []
    @Published var highPrice: Double = 0.0
    @Published var lowPrice: Double = 0.0

    private var code: String
    private var count: Int
    private var minutes: Int?
    private var chartType: ChartType

    init(code: String, count: Int, chartType: ChartType, minutes: Int?) {
        self.code = code
        self.count = count
        self.minutes = minutes
        self.chartType = chartType

        requestChartData(chartType: chartType, itemCode: code, minutes: minutes)
    }

    func calculateMinMax(data: [CoinChartModel]) {
        var high = 0.0
        var low = data.first?.low_price ?? 0.0

        data.forEach { item in
            if high < item.high_price {
                high = item.high_price
            }

            if low > item.low_price {
                low = item.low_price
            }
        }

        DispatchQueue.main.async {
            self.highPrice = high
            self.lowPrice = low
        }

    }

    func generateCommonModel(data: [CoinChartModel]) -> [CoinChartCommonModel] {
        var prev = 0
        var coinChartCommonModel: [CoinChartCommonModel] = []

        for index in 1..<data.count {
            coinChartCommonModel.append(
                CoinChartCommonModel(
                    id: data[index].id,
                    market: data[index].market,
                    candle_date_time_utc: data[index].candle_date_time_utc,
                    candle_date_time_kst: data[index].candle_date_time_kst,
                    opening_price: data[index].opening_price,
                    high_price: data[index].high_price,
                    low_price: data[index].low_price,
                    trade_price: data[index].trade_price,
                    timestamp: data[index].timestamp,
                    candle_acc_trade_price: data[index].candle_acc_trade_price,
                    candle_acc_trade_volume: data[index].candle_acc_trade_volume,
                    change: data[prev].trade_price < data[index].trade_price ? "RISE" : "FALL"
                )
            )
            prev = index
        }

        return coinChartCommonModel
    }

    func requestChartData(chartType: ChartType, itemCode: String, minutes: Int?) {
        Task {
            do {
                var data: [CoinChartModel] = []

                switch chartType {
                case .minute:
                    if let minutes = minutes {
                        data = try await fetchCoinMinuteChart(code: itemCode, count: count, minutes: "\(minutes)")
                    }
                case .day:
                    data = try await fetchCoinChart(code: itemCode, count: count, type: .day)
                case .week:
                    data = try await fetchCoinChart(code: itemCode, count: count, type: .week)
                case .month:
                    data = try await fetchCoinChart(code: itemCode, count: count, type: .month)
                }

                calculateMinMax(data: data)
                let commonData = generateCommonModel(data: data.reversed())

                DispatchQueue.main.async {
                    [weak self] in
                    guard let self = self else { return }
                    self.coinChartCommonData = commonData
                }


            } catch {
                print(error)
            }
        }
    }
}
