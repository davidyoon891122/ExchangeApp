//
//  CurrencyCardView.swift
//  TradingApp
//
//  Created by Jiwon Yoon on 2023/05/01.
//

import SwiftUI

struct CurrencyCardView: View {
    var currencyCode: String
    var currencyName: String
    var telegrahicTransferMiddle: String
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 150, height: 80)
                .cornerRadius(10)
                .foregroundColor(.indigo)
            VStack {
                HStack(alignment:.center) {
                    Text(CurrencyType(rawValue: currencyCode)?.flag ?? "🏳️")
                    Text(currencyName)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.bottom, 2)
                        .frame(width: 100)
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                }
                HStack {
                    Text(telegrahicTransferMiddle)
                        .font(.body)
                        .foregroundColor(.white)
                    Text("+0.30%")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct CurrencyCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack {
                CurrencyCardView(
                    currencyCode: "USD",
                    currencyName: "텍스트 길이가 넘치면 달러",
                    telegrahicTransferMiddle: "1,308.75"
                )
                CurrencyCardView(
                    currencyCode: "USD",
                    currencyName: "미국 달러",
                    telegrahicTransferMiddle: "1,308.75"
                )
                CurrencyCardView(
                    currencyCode: "USD",
                    currencyName: "미국 달러",
                    telegrahicTransferMiddle: "1,308.75"
                )
                CurrencyCardView(
                    currencyCode: "USD",
                    currencyName: "미국 달러",
                    telegrahicTransferMiddle: "1,308.75"
                )
                CurrencyCardView(
                    currencyCode: "USD",
                    currencyName: "미국 달러",
                    telegrahicTransferMiddle: "1,308.75"
                )
            }
            .padding(16)
        }
    }
}

enum CurrencyType: String {
    case usd = "USD"
    case thb = "THB"
    case sgd = "SGD"
    case sek = "SEK"
    case sar = "SAR"
    case nzd = "NZD"
    case nok = "NOK"
    case myr = "MYR"
    case kwd = "KWD"
    case jpy = "JPY(100)"
    case krw = "KRW"
    case idr = "IDR(100)"
    case hkd = "HKD"
    case gbp = "GBP"
    case eur = "EUR"
    case dkk = "DKK"
    case cnh = "CNH"
    case chf = "CHF"
    case cad = "CAD"
    case bnd = "BND"
    case bhd = "BHD"
    case aud = "AUD"
    case aed = "AED"

    var flag: String {
        switch self {
        case .usd:
            return "🇺🇸"
        case .thb:
            return "🇹🇭"
        case .sgd:
            return "🇸🇬"
        case .sek:
            return "🇸🇪"
        case .sar:
            return "🇸🇦"
        case .nzd:
            return "🇳🇿"
        case .nok:
            return "🇳🇴"
        case .myr:
            return "🇲🇾"
        case .kwd:
            return "🇰🇼"
        case .jpy:
            return "🇯🇵"
        case .krw:
            return "🇰🇷"
        case .idr:
            return "🇮🇩"
        case .hkd:
            return "🇭🇰"
        case .gbp:
            return "🇬🇧"
        case .eur:
            return "🇪🇺"
        case .dkk:
            return "🇩🇰"
        case .cnh:
            return "🇨🇳"
        case .chf:
            return "🇨🇭"
        case .cad:
            return "🇨🇦"
        case .bnd:
            return "🇧🇳"
        case .bhd:
            return "🇧🇭"
        case .aud:
            return "🇦🇺"
        case .aed:
            return "🇦🇪"
        }
    }
}
