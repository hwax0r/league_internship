//
//  DescriptionView.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 25.02.2022.
//

import UIKit

final class DescriptionView: UIView {
  private var companyTitleLabel: CompanyTitleLabel
  private var indi­vid­ualTax­pay­erNum­berLabel: Indi­vid­ualTax­pay­erNum­berLabel
  private var billingAdressLabel: BillingAdressLabel
  private var chequeTypeLabel: ChequeTypeLabel
  private var workingShiftLabel: WorkingShiftLabel
  private var chequeDateLabel: ChequeDateLabel

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(billingInformation: BillingInformationProtocol) {
    companyTitleLabel = CompanyTitleLabel(companyTitle: billingInformation.companyTitle)
    indi­vid­ualTax­pay­erNum­berLabel = Indi­vid­ualTax­pay­erNum­berLabel(indi­vid­ualTax­pay­erNum­ber: billingInformation.indi­vid­ualTax­pay­erNum­ber)
    billingAdressLabel = BillingAdressLabel(billingAdress: billingInformation.billingAdress)
    chequeTypeLabel = ChequeTypeLabel(chequeType: billingInformation.chequeType)
    workingShiftLabel = WorkingShiftLabel(workingShift: billingInformation.workingShift)
    chequeDateLabel = ChequeDateLabel(chequeDate: billingInformation.chequeDate)

    super.init(frame: .zero)

    configureView()
  }
  
}

// MARK: - Private methods
extension DescriptionView {
  private func configureView(){
    self.backgroundColor = .secondarySystemBackground
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addSubview(companyTitleLabel)
    self.addSubview(indi­vid­ualTax­pay­erNum­berLabel)
    self.addSubview(billingAdressLabel)
    self.addSubview(chequeTypeLabel)
    self.addSubview(workingShiftLabel)
    self.addSubview(chequeDateLabel)

    NSLayoutConstraint.activate([
      companyTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      companyTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      companyTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      indi­vid­ualTax­pay­erNum­berLabel.topAnchor.constraint(equalTo: companyTitleLabel.bottomAnchor, constant: 4),
      indi­vid­ualTax­pay­erNum­berLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      indi­vid­ualTax­pay­erNum­berLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      billingAdressLabel.topAnchor.constraint(equalTo: indi­vid­ualTax­pay­erNum­berLabel.bottomAnchor, constant: 2),
      billingAdressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      billingAdressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      chequeTypeLabel.topAnchor.constraint(equalTo: billingAdressLabel.bottomAnchor, constant: 5),
      chequeTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      chequeTypeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      workingShiftLabel.topAnchor.constraint(equalTo: chequeTypeLabel.bottomAnchor, constant: 10),
      workingShiftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      workingShiftLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),

      chequeDateLabel.topAnchor.constraint(equalTo: workingShiftLabel.topAnchor),
      chequeDateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      chequeDateLabel.bottomAnchor.constraint(equalTo: workingShiftLabel.bottomAnchor),
    ])
  }

}
