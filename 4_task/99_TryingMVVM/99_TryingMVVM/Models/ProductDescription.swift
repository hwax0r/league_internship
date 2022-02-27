//
//  ProductDescription.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 25.02.2022.
//

import Foundation

protocol ProductDescriptionProtocol {
  var name: String { get set }
  var pricePerUnit: Float { get set }
  var numberOfUnits: Int { get set }
  var totalSum: Float { get set }

  init(name: String, pricePerUnit: Float, numberOfUnits: Int)
}

struct ProductDescription: ProductDescriptionProtocol {
  var name: String
  var pricePerUnit: Float
  var numberOfUnits: Int
  var totalSum: Float

  init(name: String, pricePerUnit: Float, numberOfUnits: Int){
    self.name = name
    self.pricePerUnit = pricePerUnit
    self.numberOfUnits = numberOfUnits
    self.totalSum = pricePerUnit * Float(numberOfUnits)
  }
}
