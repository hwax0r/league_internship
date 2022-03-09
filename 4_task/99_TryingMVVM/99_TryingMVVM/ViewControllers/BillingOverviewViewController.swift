//
//  BillingOverviewViewController.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 07.03.2022.
//

import UIKit

class BillingOverviewViewController: UIViewController {
  private var billingOverviewView: BillingOverviewView

  init(billingInformation: BillingInformationProtocol) {
    billingOverviewView = BillingOverviewView(billingInformation: billingInformation)

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = billingOverviewView
  }

  override func viewDidLayoutSubviews() {
    view.frame = CGRect(x: 0,
                        y: UIScreen.main.bounds.height * 0.3 + 1 + UIScreen.main.bounds.height * 0.6 + 1,
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height - (UIScreen.main.bounds.height * 0.3 + 1 + UIScreen.main.bounds.height * 0.6 + 1))
  }
}
