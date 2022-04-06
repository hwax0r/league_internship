//
//  LargeNavigationController.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 09.03.2022.
//

import UIKit

class LargeNavigationController: UINavigationController {
  
  init(){
    super.init(nibName: nil, bundle: nil)

    self.tabBarItem.title = "LargeNav"
    self.tabBarItem.image = UIImage(systemName: "logo.xbox")!
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemGray
  }

}
