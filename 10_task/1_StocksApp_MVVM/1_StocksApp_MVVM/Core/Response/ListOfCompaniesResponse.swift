//
//  ListOfCompaniesResponse.swift
//  1_StocksApp_MVVM
//
//  Created by David Sergeev on 26.03.2022.
//

import Foundation

struct ListOfCompaniesResponse: Responsable {
  let array: [CompanyRaw]

  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let values = try container.decode([CompanyRaw].self)
    array = values
  }
}
