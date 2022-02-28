//
//  DescriptionView.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 25.02.2022.
//

import UIKit

protocol DesriptionViewProtocol: AnyObject {
  var companyTitle: CompanyTitle { get }
  var indi­vid­ualTax­pay­erNum­ber: Indi­vid­ualTax­pay­erNum­ber { get }
  var billingAdress: BillingAdress { get }
  var chequeType: ChequeType { get }

  var additionalDataView: AdditionalDataView { get }

  init(billingInformation: BillingInformationProtocol)
}

final class DesriptionView: UIView, DesriptionViewProtocol {
  private(set) var companyTitle: CompanyTitle
  private(set) var indi­vid­ualTax­pay­erNum­ber: Indi­vid­ualTax­pay­erNum­ber
  private(set) var billingAdress: BillingAdress
  private(set) var chequeType: ChequeType
  private(set) var additionalDataView: AdditionalDataView

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  required init(billingInformation: BillingInformationProtocol) {
    companyTitle = CompanyTitle(companyTitle: billingInformation.companyTitle)
    indi­vid­ualTax­pay­erNum­ber = Indi­vid­ualTax­pay­erNum­ber(indi­vid­ualTax­pay­erNum­ber: billingInformation.indi­vid­ualTax­pay­erNum­ber)
    billingAdress = BillingAdress(billingAdress: billingInformation.billingAdress)
    chequeType = ChequeType(chequeType: billingInformation.chequeType)
    additionalDataView = AdditionalDataView(workingShift: billingInformation.workingShift,
                                            chequeDate: billingInformation.chequeDate)
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
    self.addSubview(chequeType)
    self.addSubview(additionalDataView)
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

      chequeType.topAnchor.constraint(equalTo: billingAdress.bottomAnchor, constant: 5),
      chequeType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      chequeType.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      additionalDataView.topAnchor.constraint(equalTo: chequeType.bottomAnchor, constant: 10),
      additionalDataView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      additionalDataView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      additionalDataView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
    ])
  }

}

final class CompanyTitle: UILabel {
  private let companyTitle: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(companyTitle: String) {
    self.companyTitle = companyTitle
    super.init(frame: .zero)

    configureLabel()
  }

  func configureLabel(){
    self.text = companyTitle
    self.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

final class Indi­vid­ualTax­pay­erNum­ber: UILabel {
  private let indi­vid­ualTax­pay­erNum­ber: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(indi­vid­ualTax­pay­erNum­ber: String) {
    self.indi­vid­ualTax­pay­erNum­ber = indi­vid­ualTax­pay­erNum­ber
    super.init(frame: .zero)

    configureLabel()
  }

  func configureLabel(){
    self.text = indi­vid­ualTax­pay­erNum­ber
    self.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

final class BillingAdress: UILabel {
  private let billingAdress: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(billingAdress: String) {
    self.billingAdress = billingAdress
    super.init(frame: .zero)

    configureLabel()
  }

  func configureLabel(){
    self.text = billingAdress
    self.font = UIFont.systemFont(ofSize: 10, weight: .light)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

final class ChequeType: UILabel {
  private let chequeType: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(chequeType: String) {
    self.chequeType = chequeType
    super.init(frame: .zero)

    configureLabel()
  }

  func configureLabel() {
    self.text = chequeType
    self.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

final class WorkingShift: UILabel {
  private let workingShift: String
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(workingShift: String) {
    self.workingShift = workingShift
    super.init(frame: .zero)

    configureLabel()
  }

  func configureLabel() {
    self.text = workingShift
    self.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

final class ChequeDate: UILabel {
  private var chequeDate: Date
  private var chequeDateString: String
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(chequeDate: Date) {
    self.chequeDate = chequeDate

    let formatter = DateFormatter()
    formatter.dateFormat = "MM.dd.yyyy HH:mm"
    self.chequeDateString = formatter.string(from: chequeDate)
    super.init(frame: .zero)

    configureLabel()
  }

  func configureLabel() {
    self.text = chequeDateString
    self.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    self.textAlignment = NSTextAlignment.center
    self.textColor = .black
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

final class AdditionalDataView: UIStackView {
  private let workingShift: WorkingShift
  private let chequeDate: ChequeDate

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(workingShift: String, chequeDate: Date) {
    self.workingShift = WorkingShift(workingShift: workingShift)
    self.chequeDate = ChequeDate(chequeDate: chequeDate)
    super.init(frame: .zero)

    configureStackView()
  }

  func configureStackView() {
    self.axis = .horizontal
    self.spacing = 20.0
    self.alignment = .fill
    self.distribution = .equalCentering
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addArrangedSubview(workingShift)
    self.addArrangedSubview(chequeDate)
  }
}
