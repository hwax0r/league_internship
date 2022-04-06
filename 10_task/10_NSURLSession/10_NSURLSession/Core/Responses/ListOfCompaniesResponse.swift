//
//  ListOfCompaniesResponse.swift
//  10_NSURLSession
//
//  Created by David Sergeev on 22.03.2022.
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
