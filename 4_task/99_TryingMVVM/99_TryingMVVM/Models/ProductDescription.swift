//
//  ProductDescription.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 25.02.2022.
//

import Foundation

protocol ProductDescriptionProtocol {
  var name: String { get set }
  var pricePerUnit: Decimal { get set }
  var numberOfUnits: Decimal { get set }
  var totalSum: Decimal { get set }

  init(name: String, pricePerUnit: Decimal, numberOfUnits: Decimal)
}

struct ProductDescription: ProductDescriptionProtocol {
  var name: String
  var pricePerUnit: Decimal
  var numberOfUnits: Decimal
  var totalSum: Decimal

  init(name: String, pricePerUnit: Decimal, numberOfUnits: Decimal){
    self.name = name
    self.pricePerUnit = pricePerUnit
    self.numberOfUnits = numberOfUnits
    self.totalSum = pricePerUnit * numberOfUnits
  }
}
