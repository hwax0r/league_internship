//
//  BillingOverviewView.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 28.02.2022.
//

import Foundation
import UIKit

protocol BillingOverviewProtocol {
  // TODO: Convert to Decimal
  var chequeSum: Float { get }
  var totalNameLabel: TotalNameLabel { get }
  var totalSumLabel: TotalSumLabel { get }

  init(billingInformation: BillingInformationProtocol)
}

final class BillingOverviewView: UIStackView, BillingOverviewProtocol {
  var chequeSum: Float
  var totalNameLabel: TotalNameLabel
  var totalSumLabel: TotalSumLabel

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(billingInformation: BillingInformationProtocol) {
    self.chequeSum = {
      var sum: Float = 0
      for product in billingInformation.shoppingList {
        sum += product.totalSum
      }
      return sum
    }()
    totalNameLabel = TotalNameLabel()
    totalSumLabel = TotalSumLabel(totalSumFloat: chequeSum)
    super.init(frame: .zero)

    configureStackView()
  }

  func configureStackView() {
    self.axis = .horizontal
    self.spacing = 20.0
    self.alignment = .fill
    self.distribution = .equalCentering
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addArrangedSubview(totalNameLabel)
    self.addArrangedSubview(totalSumLabel)
  }
}

final class TotalNameLabel: UILabel {
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init() {
    super.init(frame: .zero)

    configureLabel()
  }

  func configureLabel() {
    self.text = "Итог:"
    self.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    self.textAlignment = NSTextAlignment.left
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

final class TotalSumLabel: UILabel {
  var totalSum: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(totalSumFloat: Float) {
    self.totalSum = String(totalSumFloat)
    super.init(frame: .zero)

    configureLabel()
  }

  func configureLabel() {
    self.text = totalSum
    self.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    self.textAlignment = NSTextAlignment.right
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

