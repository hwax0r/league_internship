//
//  TotalSumLabel.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 07.03.2022.
//

import UIKit

final class TotalSumLabel: UILabel {
  private var totalSum: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(totalSumDecimal: Decimal) {
    self.totalSum = "\(totalSumDecimal)"
    super.init(frame: .zero)

    configureLabel()
  }
}

// MARK: - Private methods
extension TotalSumLabel {
  private func configureLabel() {
    self.text = totalSum
    self.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    self.textAlignment = NSTextAlignment.right
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
