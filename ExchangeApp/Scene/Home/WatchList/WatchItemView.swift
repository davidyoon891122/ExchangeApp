//
//  WatchItemView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct WatchItemView: View {
    var iconImageName: String
    var itemName: String
    var itemCode: String
    var price: Double
    var percent: Double
    var body: some View {
        HStack {
            Image(iconImageName)
                .resizable()
                .frame(width: 40, height: 40)
            VStack {
                HStack {
                    Text(itemCode)
                        .font(.title)
                        .bold()
                    Spacer()
                    Text(String(format: "%.2f", price))
                        .font(.title2)
                        .bold()
                }
                HStack {
                    Text(itemName)
                        .font(.title3)
                        .foregroundColor(.gray)

                    Spacer()
                    Text(String(format: "-%.2f%%", percent))
                        .font(.title3)
                        .foregroundColor(.green)
                }
            }
            .padding(.leading, 8)
        }
        .padding(.horizontal)
    }
}

struct WatchItemView_Previews: PreviewProvider {
    static var previews: some View {
        WatchItemView(iconImageName: "bitcoin", itemName: "BTC", itemCode: "BTC", price: 26824.46, percent: 0.18)
    }
}
