//
//  XIBView.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 09.03.2022.
//

import UIKit

class XIBView: UIView {
  @IBOutlet weak var view: UIView!

  override init(frame: CGRect) {
    super.init(frame: frame)

    Bundle.main.loadNibNamed("XIBView", owner: self, options: nil)
    addSubview(view)
    view.frame = frame
    view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // написать констрейнтами
}
