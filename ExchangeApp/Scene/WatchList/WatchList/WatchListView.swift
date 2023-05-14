//
//  WatchListView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct WatchListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(0..<10) { _ in
                        NavigationLink(destination: ItemDetailView()) {
                            WatchItemView(iconImageName: "bitcoin", itemName: "BTC", itemCode: "BTC", price: 26824.46, percent: 0.18)
                        }
                    }
                }
            }
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
