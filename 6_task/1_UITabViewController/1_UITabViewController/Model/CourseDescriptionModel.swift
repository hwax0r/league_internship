//
//  CourseDescriptionModel.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 14.03.2022.
//

import Foundation

enum CurrencyEnum: String {
  case rub = "₽"
  case usd = "$"
}

struct CourseDescriptionModel {
  let promo: String?
  let name: String
  let price: Float
  let currency: CurrencyEnum

  let durationInMonths: Float
  let overview: String

  func priceFormattedString() -> String {
    let formatter = NumberFormatter()
    formatter.usesGroupingSeparator = true
    formatter.groupingSeparator = " "
    formatter.groupingSize = 3
    formatter.maximumFractionDigits = 2
    formatter.decimalSeparator = "."
    guard let priceFormatted = formatter.string(from: NSNumber(value: price)) else {
      return "Wrong data!"
    }
    return "\(priceFormatted) \(currency.rawValue)"
  }
}

