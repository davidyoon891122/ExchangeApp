//
//  HomeView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/13.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var exchangeStore = ExchangeStore()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    CurrencyView(exchangeStore: exchangeStore)
                    WatchListView()
                    Spacer()
                }
                .navigationTitle("Home")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
