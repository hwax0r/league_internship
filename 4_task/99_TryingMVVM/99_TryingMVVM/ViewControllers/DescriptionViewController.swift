//
//  DescriptionViewController.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 07.03.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
  private var descriptionView: DescriptionView

  init(billingInformation: BillingInformationProtocol){
    descriptionView = DescriptionView(billingInformation: billingInformation)

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = descriptionView
  }

  override func viewDidLayoutSubviews() {
    view.frame = CGRect(x: 0,
                        y: 0,
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height * 0.3)
  }
}
