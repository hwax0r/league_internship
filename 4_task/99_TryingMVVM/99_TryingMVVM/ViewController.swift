//
//  ViewController.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 25.02.2022.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    configureView()
  }

  func configureView() {
    let billingInformation = BillingInformation(
      companyTitle: "ЯНДЕКС.МЕДИАСЕРВИСЫ",
      indi­vid­ualTax­pay­erNum­ber: "9705121040",
      billingAdress: "391434, Россия, Рязанская обл., г. Сасово, ул. Пушкина, д. 21",
      chequeType: "Кассовый чек. Приход",
      workingShift: "294",
      chequeDate: Date.init(timeIntervalSince1970: 1645471740),
      shoppingList: [
        ProductDescription(name: "Билет в филармонию", pricePerUnit: 3500, numberOfUnits: 2),
        ProductDescription(name: "Билет в кинотеатр", pricePerUnit: 650, numberOfUnits: 2),
        ProductDescription(name: "Билет на выставку", pricePerUnit: 450, numberOfUnits: 3),
      ]
    )
    let descriptionView = DesriptionView(billingInformation: billingInformation)
    let separatorView = SeparatorView()
    view.addSubview(separatorView)

    view.backgroundColor = .secondarySystemBackground

    view.addSubview(descriptionView)

    NSLayoutConstraint.activate([
      descriptionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
      descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//      descriptionView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor),

      separatorView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor),
      separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      separatorView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 1),
    ])
  }

}

