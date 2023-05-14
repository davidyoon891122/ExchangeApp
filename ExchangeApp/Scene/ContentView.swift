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
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Pay")
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Chart")
                }
            Text("Order")
                .tabItem {
                    Image(systemName: "bubble.right")
                    Text("Ideals")
                }
            Text("Show")
                .tabItem {
                    Image(systemName: "handbag")
                    Text("News")
                }
            Text("Other")
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Menu")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
