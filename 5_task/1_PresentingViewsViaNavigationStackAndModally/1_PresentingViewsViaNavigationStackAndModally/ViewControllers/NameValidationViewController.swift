//
//  NameValidationViewController.swift
//  1_PresentingViewsViaNavigationStackAndModally
//
//  Created by David Sergeev on 02.03.2022.
//

import Foundation
import UIKit

class NameValidationViewController: UIViewController {
  private lazy var nameValidationCardView = NameValidationCardView()
  private let mainView = UIView()

  override func loadView() {
    view = mainView
    view.isOpaque = true
    view.backgroundColor = .clear.withAlphaComponent(0.5)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    configureView()
  }
  
}

extension NameValidationViewController {
  func configureView() {
    view.addSubview(nameValidationCardView)

    NSLayoutConstraint.activate([
      nameValidationCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
      nameValidationCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      nameValidationCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])
  }
}
