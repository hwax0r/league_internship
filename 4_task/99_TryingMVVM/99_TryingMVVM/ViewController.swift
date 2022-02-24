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
      shoppingList: [
        ProductDescription(name: "Билет в филармонию", pricePerUnit: 3500, numberOfUnits: 2),
        ProductDescription(name: "Билет в кинотеатр", pricePerUnit: 650, numberOfUnits: 2),
        ProductDescription(name: "Билет на выставку", pricePerUnit: 450, numberOfUnits: 3),
      ]
    )
    let descriptionView = DesriptionView(billingInformation: billingInformation)

    view.backgroundColor = .secondarySystemBackground

    view.addSubview(descriptionView)

    NSLayoutConstraint.activate([
      descriptionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
      descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      descriptionView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor),
    ])
  }

}

struct ProductDescription {
  var name: String
  var pricePerUnit: Float
  var numberOfUnits: Int
  var totalSum: Float

  init(name: String, pricePerUnit: Float, numberOfUnits: Int){
    self.name = name
    self.pricePerUnit = pricePerUnit
    self.numberOfUnits = numberOfUnits
    self.totalSum = pricePerUnit * Float(numberOfUnits)
  }
}

struct BillingInformation {
  var companyTitle: String
  var indi­vid­ualTax­pay­erNum­ber: String
  var billingAdress: String
  var shoppingList: [ProductDescription]
  init(companyTitle: String, indi­vid­ualTax­pay­erNum­ber: String, billingAdress: String, shoppingList: [ProductDescription]){
    self.companyTitle = companyTitle
    self.indi­vid­ualTax­pay­erNum­ber = "ИНН:  \(indi­vid­ualTax­pay­erNum­ber)"
    self.billingAdress = billingAdress
    self.shoppingList = shoppingList
  }
}


class DesriptionView: UIView {
  var companyTitle: CompanyTitle
  var indi­vid­ualTax­pay­erNum­ber: Indi­vid­ualTax­pay­erNum­ber
  var billingAdress: BillingAdress

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(billingInformation: BillingInformation) {
    companyTitle = CompanyTitle(companyTitle: billingInformation.companyTitle)
    indi­vid­ualTax­pay­erNum­ber = Indi­vid­ualTax­pay­erNum­ber(indi­vid­ualTax­pay­erNum­ber: billingInformation.indi­vid­ualTax­pay­erNum­ber)
    billingAdress = BillingAdress(billingAdress: billingInformation.billingAdress)
    super.init(frame: .zero)

    configureView()
    setupConstrints()
  }

  func configureView() {
    self.backgroundColor = .secondarySystemBackground
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addSubview(companyTitle)
    self.addSubview(indi­vid­ualTax­pay­erNum­ber)
    self.addSubview(billingAdress)
  }

  func setupConstrints(){
    NSLayoutConstraint.activate([
      companyTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
      companyTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      companyTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      indi­vid­ualTax­pay­erNum­ber.topAnchor.constraint(equalTo: companyTitle.bottomAnchor, constant: 4),
      indi­vid­ualTax­pay­erNum­ber.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      indi­vid­ualTax­pay­erNum­ber.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      billingAdress.topAnchor.constraint(equalTo: indi­vid­ualTax­pay­erNum­ber.bottomAnchor, constant: 2),
      billingAdress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      billingAdress.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      billingAdress.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
    ])
  }

}

class CompanyTitle: UILabel {
  private let companyTitle: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(companyTitle: String) {
    self.companyTitle = companyTitle
    super.init(frame: .zero)

    configureTextField()
  }

  func configureTextField(){
    self.text = companyTitle
    self.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

class Indi­vid­ualTax­pay­erNum­ber: UILabel {
  private let indi­vid­ualTax­pay­erNum­ber: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(indi­vid­ualTax­pay­erNum­ber: String) {
    self.indi­vid­ualTax­pay­erNum­ber = indi­vid­ualTax­pay­erNum­ber
    super.init(frame: .zero)

    configureTextField()
  }

  func configureTextField(){
    self.text = indi­vid­ualTax­pay­erNum­ber
    self.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

class BillingAdress: UILabel {
  private let billingAdress: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(billingAdress: String) {
    self.billingAdress = billingAdress
    super.init(frame: .zero)

    configureTextField()
  }

  func configureTextField(){
    self.text = billingAdress
    self.font = UIFont.systemFont(ofSize: 10, weight: .light)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
