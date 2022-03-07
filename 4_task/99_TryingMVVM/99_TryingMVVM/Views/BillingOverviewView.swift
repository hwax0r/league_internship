//
//  BillingOverviewView.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 28.02.2022.
//

import Foundation
import UIKit

final class BillingOverviewView: UIStackView {
  private var chequeSum: Decimal
  private var totalNameLabel: TotalNameLabel
  private var totalSumLabel: TotalSumLabel

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(billingInformation: BillingInformationProtocol) {
    self.chequeSum = billingInformation.chequeSum()
    totalNameLabel = TotalNameLabel()
    totalSumLabel = TotalSumLabel(totalSumDecimal: chequeSum)
    super.init(frame: .zero)

    configureStackView()
  }

}

// MARK: - Private methods
extension BillingOverviewView {
  private func configureStackView() {
    self.axis = .horizontal
    self.spacing = 20.0
    self.alignment = .fill
    self.distribution = .equalCentering
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addArrangedSubview(totalNameLabel)
    self.addArrangedSubview(totalSumLabel)
  }
}
