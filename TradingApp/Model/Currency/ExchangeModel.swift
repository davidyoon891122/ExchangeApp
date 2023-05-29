//
//  ExchangeModel.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/04/30.
//

import Foundation

struct ExchangeModel: Decodable, Identifiable {
    let id = UUID()
    let result: Int // result 조회 결과
    let currencyCode: String // cur_unit 통화 코드
    let currencyName: String // cur_nm 통화 이름
    let telegrahicTransferBuying: String // ttb: TTM - MARGIN
    let telegrahicTransferSelling: String // tts: TTM + MARGIN
    let telegragicTransferMiddle: String // deal_bas_r 매매기준율
    let bkpr: String // bkpr 장부가격
    let yearExchangeCommission: String // yy_efee_r 년환가료율
    let tenDayExchangeCommission: String // ten_dd_efee_r 10일환가료율

    enum CodingKeys: String, CodingKey {
        case result, bkpr
        case currencyCode = "cur_unit"
        case currencyName = "cur_nm"
        case telegrahicTransferBuying = "ttb"
        case telegrahicTransferSelling = "tts"
        case telegragicTransferMiddle = "deal_bas_r"
        case yearExchangeCommission = "yy_efee_r"
        case tenDayExchangeCommission = "ten_dd_efee_r"
    }
}

var exchangeList: [ExchangeModel] = [
    ExchangeModel(
        result: 1,
        currencyCode: "USD",
        currencyName: "미국 달러",
        telegrahicTransferBuying: "1,305.61",
        telegrahicTransferSelling: "1,331.98",
        telegragicTransferMiddle: "1,318.8",
        bkpr: "1,318",
        yearExchangeCommission: "0",
        tenDayExchangeCommission: "0"
    ),
    ExchangeModel(
        result: 1,
        currencyCode: "THB",
        currencyName: "태국 비트",
        telegrahicTransferBuying: "1,305.61",
        telegrahicTransferSelling: "1,331.98",
        telegragicTransferMiddle: "38.29",
        bkpr: "1,318",
        yearExchangeCommission: "0",
        tenDayExchangeCommission: "0"
    ),
    ExchangeModel(
        result: 1,
        currencyCode: "SGD",
        currencyName: "싱가포르 달러",
        telegrahicTransferBuying: "1,305.61",
        telegrahicTransferSelling: "1,331.98",
        telegragicTransferMiddle: "987.98",
        bkpr: "1,318",
        yearExchangeCommission: "0",
        tenDayExchangeCommission: "0"
    ),
    ExchangeModel(
        result: 1,
        currencyCode: "SEK",
        currencyName: "스웨덴 크로나",
        telegrahicTransferBuying: "1,305.61",
        telegrahicTransferSelling: "1,331.98",
        telegragicTransferMiddle: "127.34",
        bkpr: "1,318",
        yearExchangeCommission: "0",
        tenDayExchangeCommission: "0"
    ),
    ExchangeModel(
        result: 1,
        currencyCode: "SAR",
        currencyName: "사우디 리얄",
        telegrahicTransferBuying: "1,305.61",
        telegrahicTransferSelling: "1,331.98",
        telegragicTransferMiddle: "351.65",
        bkpr: "1,318",
        yearExchangeCommission: "0",
        tenDayExchangeCommission: "0"
    ),
    ExchangeModel(
        result: 1,
        currencyCode: "NZD",
        currencyName: "뉴질랜드 달러",
        telegrahicTransferBuying: "1,305.61",
        telegrahicTransferSelling: "1,331.98",
        telegragicTransferMiddle: "1,318.8",
        bkpr: "1,318",
        yearExchangeCommission: "0",
        tenDayExchangeCommission: "0"
    ),
    ExchangeModel(
        result: 1,
        currencyCode: "NOK",
        currencyName: "노르웨이 크로네",
        telegrahicTransferBuying: "1,305.61",
        telegrahicTransferSelling: "1,331.98",
        telegragicTransferMiddle: "124.55",
        bkpr: "1,318",
        yearExchangeCommission: "0",
        tenDayExchangeCommission: "0"
    ),
    ExchangeModel(
        result: 1,
        currencyCode: "MYR",
        currencyName: "말레이지아 링기트",
        telegrahicTransferBuying: "1,305.61",
        telegrahicTransferSelling: "1,331.98",
        telegragicTransferMiddle: "296.89",
        bkpr: "1,318",
        yearExchangeCommission: "0",
        tenDayExchangeCommission: "0"
    )
]
