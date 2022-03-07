//
//  ChequeTypeLabel.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 06.03.2022.
//

import UIKit

final class ChequeTypeLabel: UILabel {
  private let chequeType: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(chequeType: String) {
    self.chequeType = chequeType
    super.init(frame: .zero)

    configureLabel()
  }

}

// MARK: - Private methods
extension ChequeTypeLabel {
  private func configureLabel() {
    self.text = chequeType
    self.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
