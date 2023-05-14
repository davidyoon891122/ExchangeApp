//
//  WatchListHomeView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/13.
//

import SwiftUI

struct WatchListHomeView: View {
    @ObservedObject var exchangeStore = ExchangeStore()
    @State private var isOpenSearch = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    CurrencyView(exchangeStore: exchangeStore)
                    WatchListView()
                    Spacer()
                }
                .navigationTitle("WatchList")
                .toolbar {
                    Button(action: {
                        isOpenSearch = true
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .tint(.black)
                    })
                }
                .sheet(isPresented: $isOpenSearch) {
                    SearchView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListHomeView()
    }
}
