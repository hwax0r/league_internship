//
//  StockDescriptionResponse.swift
//  1_StocksApp_MVVM
//
//  Created by David Sergeev on 26.03.2022.
//

import Foundation

struct StockDescriptionResponse: Responsable {
  let stockDescription: StockDescriptionRaw
  let companyInfo: CompanyRaw

  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let companyInfoValues = try container.decode(CompanyRaw.self)
    let stockDescriptionValues = try container.decode(StockDescriptionRaw.self)

    companyInfo = companyInfoValues
    stockDescription = stockDescriptionValues
  }
}
