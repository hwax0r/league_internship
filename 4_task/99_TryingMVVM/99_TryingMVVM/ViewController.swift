//
//  ViewController.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 25.02.2022.
//

import UIKit

class ViewController: UIViewController {
  /*
   let descriptionViewController: DescriptionViewController
   let shoppingListViewController: ShoppingListViewController
   let billingOverviewViewController: BillingOverviewViewController
   */
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
      ProductDescription(name: "Здесь очень длинное название, чтобы проверить отображение",
                         pricePerUnit: 99.99, numberOfUnits: 324),
      ProductDescription(name: "Какой-то товар", pricePerUnit: 99999.99, numberOfUnits: 2),
      ProductDescription(name: "Очень длинное название и длинное число", pricePerUnit: 99999.99, numberOfUnits: 3),
    ]
  )

  // Output as View Controllers
  /*
   init(){
   descriptionViewController = DescriptionViewController(billingInformation: billingInformation)
   shoppingListViewController = ShoppingListViewController(billingInformation: billingInformation)
   billingOverviewViewController = BillingOverviewViewController(billingInformation: billingInformation)

   super.init(nibName: nil, bundle: nil)
   }

   required init?(coder: NSCoder) {
   fatalError("init(coder:) has not been implemented")
   }
   */

  override func viewDidLoad() {
    super.viewDidLoad()

    // Testing output as a view
    configureView()

    // Output as View Controllers
    /*
     configureDescriptionViewController()
     configureShoppingListViewController()
     configureBillingOverviewViewController()
     */
  }

}

// MARK: - Output as View Controllers
/*
 extension ViewController {
 func add(_ child: UIViewController) {
 addChild(child)
 child.didMove(toParent: self)
 }

 func remove() {
 guard parent != nil else {
 return
 }

 willMove(toParent: nil)
 view.removeFromSuperview()
 removeFromParent()
 }

 private func configureDescriptionViewController() {
 view.addSubview(descriptionViewController.view)
 self.addChild(descriptionViewController)
 descriptionViewController.didMove(toParent: self)
 }

 private func configureShoppingListViewController() {
 self.addChild(shoppingListViewController)
 view.insertSubview(shoppingListViewController.view, at: 1)
 shoppingListViewController.didMove(toParent: self)
 }

 private func configureBillingOverviewViewController() {
 self.addChild(billingOverviewViewController)
 view.insertSubview(billingOverviewViewController.view, at: 2)
 billingOverviewViewController.didMove(toParent: self)
 }

 }
 */

// MARK: - Testing output as a view
extension ViewController {
  private func configureView() {
    let descriptionView = DescriptionView(billingInformation: billingInformation)
    let separatorView = SeparatorView()
    let shoppingListView = ShoppingListView(billingInformation: billingInformation)
    let secondSeparatorView = SeparatorView()
    let billingOverviewView = BillingOverviewView(billingInformation: billingInformation)

    view.backgroundColor = .secondarySystemBackground
    view.addSubview(descriptionView)
    view.addSubview(separatorView)
    view.addSubview(shoppingListView)
    view.addSubview(secondSeparatorView)
    view.addSubview(billingOverviewView)

    NSLayoutConstraint.activate([
      descriptionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

      separatorView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor),
      separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      separatorView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 1),

      shoppingListView.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
      shoppingListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      shoppingListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      shoppingListView.bottomAnchor.constraint(equalTo: secondSeparatorView.topAnchor),

      secondSeparatorView.topAnchor.constraint(equalTo: secondSeparatorView.bottomAnchor, constant: -1),
      secondSeparatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      secondSeparatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      secondSeparatorView.bottomAnchor.constraint(equalTo: billingOverviewView.topAnchor),

      billingOverviewView.topAnchor.constraint(equalTo: billingOverviewView.bottomAnchor, constant: -40),
      billingOverviewView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      billingOverviewView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      billingOverviewView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ])
  }
}
