//
//  CoinListView.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI

struct CoinListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Coin")
                .font(.title)
                .bold()
                .padding(.horizontal)
            ScrollView {
                ForEach(1..<10) { value in
                    CoinView()
                }
            }
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
