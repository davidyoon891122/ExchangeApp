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
            VStack(alignment: .leading) {
                Text("Search")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                ForEach(coinMarketStore.coinMarketData) { marketData in
                    SearchItemView(
                        itemCode: marketData.english_name,
                        itemName: marketData.market
                    )
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
