//
//  ItemDetailView.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI
import Charts

struct ItemDetailView: View {
    @State var item: WatchItemModel

    var body: some View {
        ScrollView {
            VStack {
                Image("bitcoin")
                    .resizable()
                    .frame(width: 60, height: 60)
                Text(item.itemName)
                    .font(.body)
                    .bold()
                    .foregroundColor(.primary)
                Text(item.itemCode)
                    .font(.callout)
                    .bold()
                    .foregroundColor(.gray)
                Text(String(format: "%.3f%", item.price))
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)
                HStack {
                    Text(item.change == "RISE"
                         ? "+\(item.changePrice.setPricesByPaymentType(type: item.itemCode))"
                         : "-\(item.changePrice.setPricesByPaymentType(type: item.itemCode))"
                    )
                        .font(.title2)
                        .bold()
                        .foregroundColor(item.change == "RISE" ? .red : .blue)
                    Text(String(format: "%.2f%%", item.percent))
                        .font(.title2)
                        .bold()
                        .foregroundColor(item.change == "RISE" ? .red : .blue)
                    Text("today")
                        .bold()
                        .font(.callout)
                        .foregroundColor(item.change == "RISE" ? .red : .blue)
                }
                ChartView(item: $item)
                DetailInfoView(item: $item)
                Spacer()
            }
        }
    }
}

struct ChartView: View {
    @Binding var item: WatchItemModel
    @ObservedObject var coinChartStore: CoinChartStore
    @State var chartType: ChartType = .week

    init(item: Binding<WatchItemModel>) {
        _item = item
        _coinChartStore = ObservedObject(initialValue: CoinChartStore(code: item.wrappedValue.itemCode, count: 30, chartType: .week, minutes: nil))
    }

    var body: some View {
        VStack {
            HStack {
                Chart {
                    ForEach(coinChartStore.coinChartCommonData) { item in
                        RectangleMark(
                            x: .value("Data", item.candle_date_time_kst),
                            yStart: .value("Low", item.low_price),
                            yEnd: .value("High", item.high_price),
                            width: 4
                        )
                        .foregroundStyle(item.change == "RISE" ? .red : .blue)
                        RectangleMark(
                            x: .value("Date", item.candle_date_time_kst),
                            yStart: .value("Open", item.opening_price),
                            yEnd: .value("Close", item.trade_price),
                            width: 12
                        )
                        .foregroundStyle(item.change == "RISE" ? .red : .blue)
                    }
                }
                .chartYScale(domain: coinChartStore.lowPrice...coinChartStore.highPrice)
                .frame(height: 250)
            }
        }
        Picker("Chart Type", selection: $chartType) {
            ForEach(ChartType.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .onChange(of: chartType) { type in
            if type == .minute {
                coinChartStore.requestChartData(chartType: type, itemCode: item.itemCode, minutes: 5)
            } else {
                coinChartStore.requestChartData(chartType: type, itemCode: item.itemCode, minutes: nil)
            }
        }
    }
}

struct DetailInfoView: View {
    @Binding var item: WatchItemModel
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text("PREV")
                    .bold()
                Spacer()
                Text(item.price.setPricesByPaymentType(type: item.itemName))
                    .bold()
            }
            .padding(.top, 2)
            HStack {
                Text("OPEN")
                    .bold()
                Spacer()
                Text(item.openingPrice.setPricesByPaymentType(type: item.itemName))
                    .bold()
            }
            .padding(.top, 2)
            HStack {
                Text("VOLUME")
                    .bold()
                Spacer()
                Text("\(item.tradeVolume)")
                    .bold()
            }
            .padding(.top, 2)
            HStack {
                Text("52 Highest Price")
                    .bold()
                Text("(\(item.highest52WeekDate))")
                    .bold()
                Spacer()
                Text(item.highest52WeekPrice.setPricesByPaymentType(type: item.itemName))
                    .bold()
            }
            .padding(.top, 2)
            HStack {
                Text("52 Lowest Price")
                    .bold()
                Text("(\(item.lowest52WeekDate))")
                    .bold()
                Spacer()
                Text(item.lowest52WeekPrice.setPricesByPaymentType(type: item.itemName))
                    .bold()
            }
            .padding(.top, 2)
            Divider()
        }
        .padding(.horizontal)
    }
}


struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: .init(
            id: UUID(),
            iconImageName: "bitconin",
            itemName: "BitCoin",
            itemCode: "USDT-BTC",
            tradeDate: "20230531",
            tradeDateKst: "20230531",
            tradeTimeKst: "220254",
            tradeTimestamp: 1685538174512,
            price: 27206.76508425,
            percent: 5.0,
            change: "FALL",
            openingPrice: 27621.07900002,
            highPrice: 28153.75340000,
            lowPrice: 26938.33284562,
            prevClosingPrice: 27799.74592647,
            changePrice: 592.98084222,
            changeRate: 0.0213304411,
            signedChangePrice: -592.98084222,
            signedChangeRate: -0.0213304411,
            tradeVolume: 0.00562613,
            accTradePrice: 46365.6312603172089107,
            accTradePrice24h: 55711.03193353,
            accTradeVolume: 1.68911049,
            accTradeVolume24h: 2.02551330,
            highest52WeekPrice: 31560.91700000,
            highest52WeekDate: "2022-06-06",
            lowest52WeekPrice: 14503.00000000,
            lowest52WeekDate: "2022-11-12",
            timestamp: 1685538900059
        )
        )
    }
}
