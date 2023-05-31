//
//  WatchListView.swift
//  TradingApp
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
                    ForEach(watchListStore.watchItemData) { item in
                        NavigationLink(destination: ItemDetailView(item: item)) {
                            WatchItemView(
                                iconImageName: "etherium",
                                itemName: item.itemName,
                                itemCode: item.itemCode,
                                price: item.price,
                                percent: item.percent,
                                change: item.change,
                                openingPrice: item.openingPrice,
                                highPrice: item.highPrice,
                                lowPrice: item.lowPrice
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
