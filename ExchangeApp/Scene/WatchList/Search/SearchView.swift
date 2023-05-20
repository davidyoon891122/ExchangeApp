//
//  SearchView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var coinMarketStore = CoinMarketStore()
    @State var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(coinMarketStore.coinMarkets) { marketData in
                        SearchItemView(
                            itemCode: marketData.english_name,
                            itemName: marketData.market
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
        SearchView()
    }
}
