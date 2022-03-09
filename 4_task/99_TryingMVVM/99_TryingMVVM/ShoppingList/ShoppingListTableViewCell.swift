//
//  ShoppingListTableViewCell.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 08.03.2022.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {
  let listPositionLabel = UILabel()
  let productNameLabel = UILabel()
  let productPricePerUnitLabel = UILabel()
  let productNumberOfUnitsLabel = UILabel()
  let productTotalSumLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    listPositionLabel.translatesAutoresizingMaskIntoConstraints = false
    productNameLabel.translatesAutoresizingMaskIntoConstraints = false
    productPricePerUnitLabel.translatesAutoresizingMaskIntoConstraints = false
    productNumberOfUnitsLabel.translatesAutoresizingMaskIntoConstraints = false
    productTotalSumLabel.translatesAutoresizingMaskIntoConstraints = false

    contentView.addSubview(listPositionLabel)
    contentView.addSubview(productNameLabel)
    contentView.addSubview(productPricePerUnitLabel)
    contentView.addSubview(productNumberOfUnitsLabel)
    contentView.addSubview(productTotalSumLabel)

    configureLabels()

    NSLayoutConstraint.activate([
      listPositionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      listPositionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      listPositionLabel.trailingAnchor.constraint(equalTo: listPositionLabel.leadingAnchor, constant: 20),
      listPositionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

      productNameLabel.topAnchor.constraint(equalTo: listPositionLabel.topAnchor),
      productNameLabel.leadingAnchor.constraint(equalTo: listPositionLabel.trailingAnchor, constant: 5),
      productNameLabel.trailingAnchor.constraint(equalTo: productPricePerUnitLabel.leadingAnchor, constant: -5),
      productNameLabel.bottomAnchor.constraint(equalTo: listPositionLabel.bottomAnchor),


      productPricePerUnitLabel.topAnchor.constraint(equalTo: listPositionLabel.topAnchor),
      productPricePerUnitLabel.leadingAnchor.constraint(equalTo: productPricePerUnitLabel.trailingAnchor, constant: -70),
      productPricePerUnitLabel.trailingAnchor.constraint(equalTo: productNumberOfUnitsLabel.leadingAnchor, constant: -10),
      productPricePerUnitLabel.bottomAnchor.constraint(equalTo: listPositionLabel.bottomAnchor),

      productNumberOfUnitsLabel.topAnchor.constraint(equalTo: listPositionLabel.topAnchor),
      productNumberOfUnitsLabel.leadingAnchor.constraint(equalTo: productNumberOfUnitsLabel.trailingAnchor, constant: -30),
      productNumberOfUnitsLabel.trailingAnchor.constraint(equalTo: productTotalSumLabel.leadingAnchor, constant: -10),
      productNumberOfUnitsLabel.bottomAnchor.constraint(equalTo: listPositionLabel.bottomAnchor),

      productTotalSumLabel.topAnchor.constraint(equalTo: listPositionLabel.topAnchor),
      productTotalSumLabel.leadingAnchor.constraint(equalTo: productTotalSumLabel.trailingAnchor, constant: -80),
      productTotalSumLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      productTotalSumLabel.bottomAnchor.constraint(equalTo: listPositionLabel.bottomAnchor),
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

// MARK: - Private methods
extension ShoppingListTableViewCell {
  private func configureLabels() {
    let fontSize: CGFloat = 13

    listPositionLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    listPositionLabel.textAlignment = .right

    productNameLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
    productNameLabel.textAlignment = .left

    productPricePerUnitLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .light)
    productPricePerUnitLabel.textAlignment = .right

    productNumberOfUnitsLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .light)
    productNumberOfUnitsLabel.textAlignment = .right

    productTotalSumLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    productTotalSumLabel.textAlignment = .right
  }

}
