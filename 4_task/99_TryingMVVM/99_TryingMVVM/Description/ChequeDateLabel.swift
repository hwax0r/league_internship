//
//  ChequeDateLabel.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 06.03.2022.
//

import UIKit

final class ChequeDateLabel: UILabel {
  private var chequeDate: Date
  private var chequeDateString: String

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(chequeDate: Date) {
    self.chequeDate = chequeDate

    let formatter = DateFormatter()
    formatter.dateFormat = "MM.dd.yyyy HH:mm"
    self.chequeDateString = formatter.string(from: chequeDate)
    super.init(frame: .zero)

    configureLabel()
  }
  
}

// MARK: - Private methods
extension ChequeDateLabel {
  private func configureLabel() {
    self.text = chequeDateString
    self.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
