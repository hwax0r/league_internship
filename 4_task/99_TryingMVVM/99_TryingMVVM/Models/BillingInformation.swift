//
//  BillingInformation.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 25.02.2022.
//

import Foundation

protocol BillingInformationProtocol {
  var companyTitle: String { get set }
  var indi­vid­ualTax­pay­erNum­ber: String { get set }
  var billingAdress: String { get set }
  var chequeType: String { get set }

  var workingShift: String { get set }
  var chequeDate: Date { get set }

  var shoppingList: [ProductDescriptionProtocol] { get set }
  
  init(companyTitle: String, indi­vid­ualTax­pay­erNum­ber: String,
       billingAdress: String, chequeType: String,
       workingShift: String, chequeDate: Date,
       shoppingList: [ProductDescriptionProtocol])
}

struct BillingInformation: BillingInformationProtocol {
  var companyTitle: String
  var indi­vid­ualTax­pay­erNum­ber: String
  var billingAdress: String
  var chequeType: String

  var workingShift: String
  var chequeDate: Date

  var shoppingList: [ProductDescriptionProtocol]

  init(companyTitle: String, indi­vid­ualTax­pay­erNum­ber: String,
       billingAdress: String, chequeType: String,
       workingShift: String, chequeDate: Date,
       shoppingList: [ProductDescriptionProtocol]){
    self.companyTitle = companyTitle
    self.indi­vid­ualTax­pay­erNum­ber = "ИНН:  \(indi­vid­ualTax­pay­erNum­ber)"
    self.billingAdress = billingAdress
    self.chequeType = chequeType

    self.workingShift = "Смена N \(workingShift)"
    self.chequeDate = chequeDate

    self.shoppingList = shoppingList
  }
}
