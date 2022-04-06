//
//  AutoLayoutNavigationController.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 09.03.2022.
//

import UIKit

class AutoLayoutNavigationController: UINavigationController {
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)

    self.tabBarItem.title = "ALayout"
    self.tabBarItem.image = UIImage(systemName: "heart")!
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemTeal

    navigationBar.prefersLargeTitles = true
  }

}
