//
//  ButtonWithoutAction.swift
//  1_PresentingViewsViaNavigationStackAndModally
//
//  Created by David Sergeev on 06.03.2022.
//

import UIKit

class ButtonWithoutAction: UIButton {
  
  init(titleForNormal: String){
    super.init(frame: .zero)

    self.setTitle(titleForNormal, for: .normal)
    self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    self.setTitleColor(.black, for: .normal)
    self.layer.cornerRadius = 4
    self.backgroundColor = .gray
    self.translatesAutoresizingMaskIntoConstraints = false
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
