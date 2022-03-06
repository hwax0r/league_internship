//
//  EmailValidationCardView.swift
//  1_PresentingViewsViaNavigationStackAndModally
//
//  Created by David Sergeev on 02.03.2022.
//

import UIKit

final class EmailValidationCardView: ValidationCardView {
  private let textFieldPlaceholder = "Введите email..."
  private let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

  init() {
    super.init(textFieldPlaceholder: textFieldPlaceholder, regEx: regEx)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
