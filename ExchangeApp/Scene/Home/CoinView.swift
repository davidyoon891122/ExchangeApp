//
//  CoinView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct CoinView: View {
    var body: some View {
        HStack {
            Image("bitcoin")
                .resizable()
                .frame(width: 40, height: 40)
            VStack {
                HStack {
                    Text("BNB")
                        .font(.title)
                        .bold()
                    Spacer()
                    Text("$312.10")
                        .font(.title2)
                        .bold()
                }
                HStack {
                    Text("BNB")
                        .font(.title3)
                        .foregroundColor(.gray)

                    Spacer()
                    Text("+0.71%")
                        .font(.title3)
                        .foregroundColor(.green)
                }
            }
            .padding(.leading, 8)
        }
        .padding(.horizontal)
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView()
    }
}
