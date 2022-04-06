//
//  XIBController.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 09.03.2022.
//

import UIKit

class XIBController: UIViewController {
  private var xibView: XIBView

  init() {
    xibView = XIBView(frame: UIScreen.main.bounds)
    super.init(nibName: nil, bundle: nil)
    
    self.tabBarItem.title = "XIB"
    self.tabBarItem.image = UIImage(systemName: "trash.circle")!
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()
    view = xibView
    view.backgroundColor = .systemGreen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
