//
//  StockDescriptionRaw.swift
//  1_StocksApp_MVVM
//
//  Created by David Sergeev on 26.03.2022.
//

import Foundation

struct StockDescriptionRaw: Codable {
  let iexOpen: Float
  let iexClose: Float
  let currency: String
}
