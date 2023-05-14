//
//  SearchView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var coinMarketStore = CoinMarketStore()
    var body: some View {
        ScrollView {
            Text("Search")
            VStack {
                ForEach(coinMarketStore.coinMarketData) { marketData in
                    Text(marketData.english_name)

                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
