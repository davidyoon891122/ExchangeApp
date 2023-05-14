//
//  WatchListHomeView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/13.
//

import SwiftUI

struct WatchListHomeView: View {
    @ObservedObject var exchangeStore = ExchangeStore()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    CurrencyView(exchangeStore: exchangeStore)
                    WatchListView()
                    Spacer()
                }
                .navigationTitle("WatchList")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListHomeView()
    }
}
