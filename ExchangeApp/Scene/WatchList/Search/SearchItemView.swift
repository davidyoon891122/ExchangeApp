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
    @State var isLike: Bool = false
    var toggleAction: () -> Void
    var body: some View {
        VStack {
            HStack {
                Image("bitcoin")
                    .resizable()
                    .frame(width: 30, height: 30)
                VStack {
                    HStack {
                        Text(itemName)
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("Upbit")
                            .font(.title3)
                            .bold()
                    }
                    HStack {
                        Text(itemCode)
                            .foregroundColor(.gray)
                            .font(.headline)
                            .bold()
                            .lineLimit(1)
                        Spacer()
                        Text("Crypto")
                            .font(.headline)
                    }
                }
                .padding(.leading, 8)
                Button(action: {
                    toggleAction()
                    isLike.toggle()
                }, label: {
                    Image(systemName: isLike ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.yellow)
                        .padding(.leading, 8)
                })
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(itemCode: "BTC", itemName: "BTC", isLike: false, toggleAction: {
            print("Toggle")
        })
    }
}
