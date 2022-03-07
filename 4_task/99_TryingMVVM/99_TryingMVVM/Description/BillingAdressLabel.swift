//
//  BillingAdressLabel.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 06.03.2022.
//

import UIKit

final class BillingAdressLabel: UILabel {
  private let billingAdress: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(billingAdress: String) {
    self.billingAdress = billingAdress
    super.init(frame: .zero)

    configureLabel()
  }

}

// MARK: - Private methods
extension BillingAdressLabel {
  private func configureLabel(){
    self.text = billingAdress
    self.font = UIFont.systemFont(ofSize: 10, weight: .light)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
