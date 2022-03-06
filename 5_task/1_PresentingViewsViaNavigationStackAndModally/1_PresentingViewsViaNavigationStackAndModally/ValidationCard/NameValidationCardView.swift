//
//  NameValidationCardView.swift
//  1_PresentingViewsViaNavigationStackAndModally
//
//  Created by David Sergeev on 02.03.2022.
//

import UIKit

final class NameValidationCardView: ValidationCardView {
  private let textFieldPlaceholder = "Введите имя и фамилию..."
  private let regEx = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"

  init() {
    super.init(textFieldPlaceholder: textFieldPlaceholder, regEx: regEx)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
