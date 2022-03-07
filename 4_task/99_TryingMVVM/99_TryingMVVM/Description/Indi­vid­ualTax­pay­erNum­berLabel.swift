//
//  Indi­vid­ualTax­pay­erNum­berLabel.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 06.03.2022.
//

import UIKit

final class Indi­vid­ualTax­pay­erNum­berLabel: UILabel {
  private let indi­vid­ualTax­pay­erNum­ber: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(indi­vid­ualTax­pay­erNum­ber: String) {
    self.indi­vid­ualTax­pay­erNum­ber = indi­vid­ualTax­pay­erNum­ber
    super.init(frame: .zero)

    configureLabel()
  }

}

// MARK: - Private methods
extension Indi­vid­ualTax­pay­erNum­berLabel {
  private func configureLabel(){
    self.text = indi­vid­ualTax­pay­erNum­ber
    self.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
