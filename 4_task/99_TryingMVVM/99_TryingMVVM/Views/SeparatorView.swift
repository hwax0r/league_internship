//
//  SeparatorView.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 26.02.2022.
//

import UIKit

final class SeparatorView: UIView {
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(){
    super.init(frame: .zero)

    configureView()
  }
}

// MARK: - Private methods
extension SeparatorView {
  private func configureView() {
    self.backgroundColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
