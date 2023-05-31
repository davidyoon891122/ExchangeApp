//
//  ItemDetailView.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct ItemDetailView: View {
    @State var item: WatchItemModel

    var body: some View {
        Text("Description of the item")
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: .init(
            id: UUID(),
            iconImageName: "bitconin",
            itemName: "BitCoin",
            itemCode: "KRW-BTC",
            price: 32000000,
            percent: 5.0,
            change: "RISE",
            openingPrice: 3000000,
            highPrice: 4000000,
            lowPrice: 2000000)
        )
    }
}
