//
//  TotalNameLabel.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 07.03.2022.
//

import UIKit

final class TotalNameLabel: UILabel {
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init() {
    super.init(frame: .zero)

    configureLabel()
  }
}

// MARK: - Private methods
extension TotalNameLabel {
  private func configureLabel() {
    self.text = "Итог:"
    self.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    self.textAlignment = NSTextAlignment.left
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
