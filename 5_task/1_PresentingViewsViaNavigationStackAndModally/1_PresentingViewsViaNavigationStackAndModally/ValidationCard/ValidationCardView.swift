//
//  ValidationCardView.swift
//  1_PresentingViewsViaNavigationStackAndModally
//
//  Created by David Sergeev on 02.03.2022.
//

import UIKit

class ValidationCardView: UIView {
  private var textField: UITextField
  private var validationButton: UIButton
  private var validationStatusLabel: UILabel
  private var regEx: String

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(textFieldPlaceholder: String, regEx: String) {
    textField = UITextField()
    validationButton = UIButton()
    validationStatusLabel = UILabel()
    self.regEx = regEx

    super.init(frame: .zero)

    setupView()
    setupTextField(placeholder: textFieldPlaceholder)
    setupValidationButton()
    setupValidationStatusLabel()
    setupInnerConstraints()
  }

  func setupView() {
    self.backgroundColor = .secondarySystemBackground
    self.layer.cornerRadius = 12
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addSubview(textField)
    self.addSubview(validationButton)
    self.addSubview(validationStatusLabel)
  }

  func setupTextField(placeholder: String) {
    textField.placeholder = placeholder
    textField.borderStyle = .roundedRect
    textField.backgroundColor = .systemBackground
    textField.translatesAutoresizingMaskIntoConstraints = false
  }

  func setupValidationButton() {
    validationButton.setTitle("Валидировать", for: .normal)
    validationButton.setTitle("ДАВАЙ, ЖМИ ЕЩË", for: .highlighted)
    validationButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    validationButton.backgroundColor = .blue
    validationButton.setTitleColor(.white, for: .normal)
    validationButton.addTarget(self, action: #selector(validationByRegExInProperty), for: .touchUpInside)
    validationButton.translatesAutoresizingMaskIntoConstraints = false
  }

  func setupValidationStatusLabel() {
    validationStatusLabel.text = "Ожидание валидации..."
    validationStatusLabel.translatesAutoresizingMaskIntoConstraints = false
  }

  func setupInnerConstraints() {
    NSLayoutConstraint.activate([
      textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      validationButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
      validationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      validationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      validationStatusLabel.topAnchor.constraint(equalTo: validationButton.bottomAnchor, constant: 20),
      validationStatusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      validationStatusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      validationStatusLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
    ])
  }

  @objc private func validationByRegExInProperty() {
      let predicate = NSPredicate(format: "SELF MATCHES[c] %@", self.regEx)
      let isValid = predicate.evaluate(with: textField.text)
      validationStatusLabel.text = isValid ? "Валидация прошла успешно" : "Валидация не прошла"
      validationStatusLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}

