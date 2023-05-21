//
//  WatchListView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct WatchListView: View {
    @ObservedObject var watchListStore: WatchListStore
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(watchListStore.coinTickerData) { item in
                        NavigationLink(destination: ItemDetailView()) {
                            WatchItemView(
                                iconImageName: "bitcoin",
                                itemName: item.market,
                                itemCode: item.market,
                                price: item.tradePrice,
                                percent: ((item.tradePrice - item.prevClosingPrice) * 100) / item.prevClosingPrice ,
                                change: item.change
                            )
                        }
                    }
                }
            }
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView(watchListStore: WatchListStore())
    }
}
