//
//  ShoppingListViewController.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 07.03.2022.
//

import UIKit

class ShoppingListViewController: UIViewController {
  private var shoppingListView: ShoppingListView

  init(billingInformation: BillingInformationProtocol) {
    shoppingListView = ShoppingListView(billingInformation: billingInformation)

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = shoppingListView
  }

  override func viewDidLayoutSubviews() {
    view.frame = CGRect(x: 0,
                        y: UIScreen.main.bounds.height * 0.3 + 1,
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height * 0.6)
  }

}
