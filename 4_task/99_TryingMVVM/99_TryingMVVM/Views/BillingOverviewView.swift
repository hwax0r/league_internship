//
//  BillingOverviewView.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 28.02.2022.
//

import UIKit

final class BillingOverviewView: UIView {
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

    configureView()
  }

}

// MARK: - Private methods
extension BillingOverviewView {
  private func configureView() {
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addSubview(totalNameLabel)
    self.addSubview(totalSumLabel)

    NSLayoutConstraint.activate([
      totalNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
      totalNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
      totalNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),

      totalSumLabel.topAnchor.constraint(equalTo: totalNameLabel.topAnchor),
      totalSumLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5),
      totalSumLabel.bottomAnchor.constraint(equalTo: totalNameLabel.bottomAnchor),
    ])
  }
}
