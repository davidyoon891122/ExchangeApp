//
//  CurrencyView.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/13.
//

import SwiftUI

struct CurrencyView: View {
    @ObservedObject var exchangeStore: ExchangeStore = ExchangeStore()
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(exchangeStore.exchangeData) { data in
                        NavigationLink(destination: CurrencyDetailView()) {
                            CurrencyCardView(
                                currencyCode: data.currencyCode,
                                currencyName: data.currencyName,
                                telegrahicTransferMiddle: data.telegragicTransferMiddle
                            )
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                .padding(16)
            }
            .frame(maxHeight: 100)
        }
    }
}

func deleteItem(at offset: IndexSet) {
    print(offset)
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
