//
//  ManualLayoutNavigationController.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 09.03.2022.
//

import UIKit

class ManualLayoutNavigationController: UINavigationController {

  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)

    self.tabBarItem.title = "MLayout"
    self.tabBarItem.image = UIImage(systemName: "eye.trianglebadge.exclamationmark")!
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemOrange

    navigationBar.prefersLargeTitles = true
  }

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()

//    guard let rootViewControler = viewControllers.first else {
//      return
//    }
//
//    let navigationItemHeight: CGFloat = 44
//    let viewAnchorPoint = CGPoint(x: 0,
//                                  y: navigationItemHeight + 1.0)
//    let viewWidth: CGFloat = UIScreen.main.bounds.width
//    let viewHeight: CGFloat = UIScreen.main.bounds.height - 44.0 - tabBarController!.tabBar.frame.size.height
//    rootViewControler.view.frame = CGRect(x: viewAnchorPoint.x,
//                                               y: viewAnchorPoint.y,
//                                               width: viewWidth,
//                                               height: viewHeight)
  }
}
