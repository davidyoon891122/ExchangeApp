//
//  SearchView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var coinMarketStore = CoinMarketStore()
    @ObservedObject var watchListStore: WatchListStore
    @State var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(coinMarketStore.coinMarkets) { marketData in
                        let isLike = watchListStore.isLikeItem(code: marketData.market)
                        SearchItemView(
                            itemCode: marketData.english_name,
                            itemName: marketData.market,
                            isLike: isLike,
                            toggleAction: {
                                if isLike {
                                    watchListStore.removeItemFromWatchList(code: marketData.market)
                                } else {
                                    watchListStore.addItemToWatchList(code: marketData.market)
                                }
                            }
                        )
                    }
                }
            }
        }
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer
        )
        .onChange(of: searchText) { newValue in
            coinMarketStore.searchItem(item: newValue)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(watchListStore: WatchListStore())
    }
}
