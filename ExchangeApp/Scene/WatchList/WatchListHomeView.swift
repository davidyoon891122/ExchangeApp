//
//  WatchListHomeView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/13.
//

import SwiftUI

struct WatchListHomeView: View {
    @State private var isOpenSearch = false
    @ObservedObject var watchListStore = WatchListStore()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    CurrencyView()
                    WatchListView(watchListStore: watchListStore)
                    Spacer()
                }
            }
            .navigationTitle("WatchList")
            .toolbar {
                Button(action: {
                    isOpenSearch = true
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .tint(.black)
                })
                .sheet(isPresented: $isOpenSearch, onDismiss: {
                    watchListStore.refreshView()
                }) {
                    SearchView(watchListStore: watchListStore)
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
