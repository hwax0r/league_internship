//
//  DescriptionView.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 25.02.2022.
//

import UIKit

final class DesriptionView: UIView {
  private var companyTitle: CompanyTitleLabel
  private var indi­vid­ualTax­pay­erNum­ber: Indi­vid­ualTax­pay­erNum­berLabel
  private var billingAdress: BillingAdressLabel
  private var chequeType: ChequeTypeLabel
  private var additionalDataView: AdditionalDataView

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(billingInformation: BillingInformationProtocol) {
    companyTitle = CompanyTitleLabel(companyTitle: billingInformation.companyTitle)
    indi­vid­ualTax­pay­erNum­ber = Indi­vid­ualTax­pay­erNum­berLabel(indi­vid­ualTax­pay­erNum­ber: billingInformation.indi­vid­ualTax­pay­erNum­ber)
    billingAdress = BillingAdressLabel(billingAdress: billingInformation.billingAdress)
    chequeType = ChequeTypeLabel(chequeType: billingInformation.chequeType)
    additionalDataView = AdditionalDataView(workingShift: billingInformation.workingShift,
                                            chequeDate: billingInformation.chequeDate)
    super.init(frame: .zero)

    configureView()
  }

}

// MARK: - Private methods
extension DesriptionView {
  private func configureView(){
    self.backgroundColor = .secondarySystemBackground
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addSubview(companyTitle)
    self.addSubview(indi­vid­ualTax­pay­erNum­ber)
    self.addSubview(billingAdress)
    self.addSubview(chequeType)
    self.addSubview(additionalDataView)

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

final class AdditionalDataView: UIStackView {
  private let workingShiftLabel: WorkingShiftLabel
  private let chequeDateLabel: ChequeDateLabel

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(workingShift: String, chequeDate: Date) {
    self.workingShiftLabel = WorkingShiftLabel(workingShift: workingShift)
    self.chequeDateLabel = ChequeDateLabel(chequeDate: chequeDate)
    super.init(frame: .zero)

    configureStackView()
  }

  private func configureStackView() {
    self.axis = .horizontal
    self.spacing = 20.0
    self.alignment = .fill
    self.distribution = .equalCentering
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addArrangedSubview(workingShiftLabel)
    self.addArrangedSubview(chequeDateLabel)
  }
}
