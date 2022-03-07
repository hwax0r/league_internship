//
//  WorkingShiftLabel.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 06.03.2022.
//

import UIKit

final class WorkingShiftLabel: UILabel {
  private let workingShift: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(workingShift: String) {
    self.workingShift = workingShift
    super.init(frame: .zero)

    configureLabel()
  }
  
}

// MARK: - Private methods
extension WorkingShiftLabel {
  private func configureLabel() {
    self.text = workingShift
    self.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
