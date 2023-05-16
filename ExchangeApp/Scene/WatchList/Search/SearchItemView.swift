//
//  SearchItemView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct SearchItemView: View {
    var itemCode: String
    var itemName: String
    var isLike: Bool = false
    var body: some View {
        HStack {
            Image("bitcoin")
                .resizable()
                .frame(width: 40, height: 40)
            VStack {
                HStack {
                    Text(itemName)
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text("Upbit")
                        .font(.title2)
                        .bold()
                }
                HStack {
                    Text(itemCode)
                        .foregroundColor(.gray)
                        .font(.title3)
                        .bold()
                        .lineLimit(1)
                    Spacer()
                    Text("Crypto")
                }
                Divider()
            }
            .padding(.leading, 8)
            Image(systemName: "star")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.yellow)
                .padding(.leading, 8)
        }
        .padding(.horizontal)
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(itemCode: "BTC", itemName: "BTC")
    }
}
