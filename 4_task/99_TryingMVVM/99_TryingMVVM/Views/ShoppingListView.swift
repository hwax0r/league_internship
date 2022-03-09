//
//  ShoppingListView.swift
//  99_TryingMVVM
//
//  Created by David Sergeev on 25.02.2022.
//

import UIKit

final class ShoppingListView: UITableView {
  var productDescriptionData: [ProductDescriptionProtocol]
  let cellIdentifier = "productDescriptionCell"

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(billingInformation: BillingInformationProtocol) {
    productDescriptionData = billingInformation.shoppingList
    super.init(frame: .zero, style: .plain)

    configureTableView()
    setupTableView()
  }

}

// MARK: - Private methods
extension ShoppingListView {
  private func configureTableView() {
    self.dataSource = self
    self.translatesAutoresizingMaskIntoConstraints = false
  }

  private func setupTableView() {
    self.register(ShoppingListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
  }
}

// MARK: - ShoppingListView DataSource
extension ShoppingListView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productDescriptionData.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ShoppingListTableViewCell
    cell.selectionStyle = .none
    cell.listPositionLabel.text = "\(indexPath.row+1)."
    cell.productNameLabel.text = "\(productDescriptionData[indexPath.row].name)"
    cell.productPricePerUnitLabel.text = "\(productDescriptionData[indexPath.row].pricePerUnit)"
    cell.productNumberOfUnitsLabel.text = "\(productDescriptionData[indexPath.row].numberOfUnits)"
    cell.productTotalSumLabel.text = "\(productDescriptionData[indexPath.row].totalSum)"
    return cell
  }
  
}
