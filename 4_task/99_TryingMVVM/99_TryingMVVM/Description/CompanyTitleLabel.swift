//
//  CompanyTitleLabel.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 06.03.2022.
//

import UIKit

final class CompanyTitleLabel: UILabel {
  private let companyTitle: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(companyTitle: String) {
    self.companyTitle = companyTitle
    super.init(frame: .zero)

    configureLabel()
  }

}

// MARK: - Private methods
extension CompanyTitleLabel {
  private func configureLabel(){
    self.text = companyTitle
    self.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
