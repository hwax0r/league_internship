//
//  StockDescriptionModel.swift
//  1_StocksApp_MVVM
//
//  Created by David Sergeev on 28.03.2022.
//

import Foundation

struct StockDescriptionModel {
  let companyName: String
  let symbol: String
  let closePrice: String
  let priceChange: String

  init(from response: StockDescriptionResponse) {
    companyName = response.companyInfo.companyName
    symbol = response.companyInfo.symbol
    closePrice = "\(String(format: "%.2f", response.stockDescription.iexClose)) \(response.stockDescription.currency)"
    let priceChangeFloat = response.stockDescription.iexClose - response.stockDescription.iexOpen
    priceChange = "\(String(format: "%.2f", priceChangeFloat)) \(response.stockDescription.currency)"
  }
}
