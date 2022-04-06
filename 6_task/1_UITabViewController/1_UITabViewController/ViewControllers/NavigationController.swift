//
//  NavigationController.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 09.03.2022.
//

import UIKit

class NavigationController: UINavigationController {
  
  init() {
    super.init(nibName: nil, bundle: nil)

    self.tabBarItem.title = "Nav"
    self.tabBarItem.image = UIImage(systemName: "hand.thumbsup")!
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBlue
  }
  
}
