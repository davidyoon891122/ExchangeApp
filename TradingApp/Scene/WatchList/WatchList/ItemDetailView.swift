//
//  ItemDetailView.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct ItemDetailView: View {
    @State var item: WatchItemModel

    var body: some View {
        VStack {
            Image("bitcoin")
                .resizable()
                .frame(width: 50, height: 50)
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
                Text("\(item.changePrice.setPricesByPaymentType(type: item.itemCode))")
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
        }
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
