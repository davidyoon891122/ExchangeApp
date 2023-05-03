//
//  ContentView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/04/09.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var exchangeStore = ExchangeStore()
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(exchangeStore.exchangeData) { data in
                        CurrencyCardView(
                            currencyCode: data.currencyCode,
                            currencyName: data.currencyName,
                            telegrahicTransferMiddle: data.telegragicTransferMiddle
                        )
                    }
                }
                .padding(16)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
