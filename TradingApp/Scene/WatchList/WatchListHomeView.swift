//
//  WatchListHomeView.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/13.
//

import SwiftUI

struct WatchListHomeView: View {
    @State private var isOpenSearch = false
    @State var watchListStore = WatchListStore()
    @State private var isShow = true
    @Environment(\.colorScheme) var colorScheme
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
                    withAnimation {
                        isShow.toggle()
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .tint(colorScheme == .dark ? Color.white : Color.black)
                })
                .sheet(isPresented: $isOpenSearch, onDismiss: {
                    watchListStore.refreshView()
                    withAnimation {
                        isShow.toggle()
                    }
                }) {
                    SearchView(watchListStore: $watchListStore)
                }
            }
        }
        .background(Color(UIColor.systemBackground))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListHomeView()
    }
}
