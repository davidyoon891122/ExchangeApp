//
//  WatchItemView.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/14.
//

import SwiftUI
import Charts

struct WatchItemView: View {
    var iconImageName: String
    var itemName: String
    var itemCode: String
    var price: Double
    var percent: Double
    var change: String
    var openingPrice: Double
    var highPrice: Double
    var lowPrice: Double
    var body: some View {

        VStack {
            HStack {
                Chart {
                    RectangleMark(
                        x: .value("Data", ""),
                        yStart: .value("Low", lowPrice),
                        yEnd: .value("High", highPrice),
                        width: 8
                    )
                    .foregroundStyle(.red)
                    RectangleMark(
                        x: .value("Date", ""),
                        yStart: .value("Open", openingPrice),
                        yEnd: .value("Close", price),
                        width: 20
                    )
                    .foregroundStyle(.red)
                }
                .alignmentGuide(VerticalAlignment.center) {
                    $0.height - 40
                }
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
                .frame(width: 30, height: 50)
                Image(iconImageName)
                    .resizable()
                    .frame(width: 30, height: 30)
                VStack {
                    HStack {
                        Text(itemCode)
                            .foregroundColor(.black)
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("\(price.setPricesByPaymentType(type: itemCode))")
                            .foregroundColor(change == "RISE" ? .red : .blue)
                            .font(.title3)
                            .bold()
                    }
                    HStack {
                        Text(itemName)
                            .font(.headline)
                            .foregroundColor(.gray)

                        Spacer()
                        Text(String(format: "%.2f%%", percent))
                            .font(.headline)
                            .foregroundColor(change == "RISE" ? .red : .blue)
                    }
                }
                .padding(.leading, 8)
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

struct WatchItemView_Previews: PreviewProvider {
    static var previews: some View {
        WatchItemView(
            iconImageName: "bitcoin",
            itemName: "BTC",
            itemCode: "BTC",
            price: 26824.46,
            percent: 0.18,
            change: "RISE",
            openingPrice: 25000.000,
            highPrice: 30000.000,
            lowPrice: 20000.000
        )
    }
}
