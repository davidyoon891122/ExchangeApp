//
//  ContentView.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/04/09.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView {
            WatchListHomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("WathList")
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
        .background(colorScheme == .dark ? Color.black : Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()

            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
