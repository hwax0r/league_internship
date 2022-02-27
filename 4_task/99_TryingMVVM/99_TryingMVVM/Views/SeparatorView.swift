//
//  SeparatorView.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 26.02.2022.
//

import UIKit

protocol SeparatorViewProtocol {
}

class SeparatorView: UIView, SeparatorViewProtocol {
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(){
    super.init(frame: .zero)

    configureView()
  }

  func configureView() {
    self.backgroundColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
