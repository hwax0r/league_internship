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
    self.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
  }
}

// MARK: - ShoppingListView DataSource
extension ShoppingListView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productDescriptionData.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    cell.selectionStyle = .none
    var content = cell.defaultContentConfiguration()
    content.text = "\(indexPath.row) \(productDescriptionData[indexPath.row].name) \(productDescriptionData[indexPath.row].pricePerUnit)*\(productDescriptionData[indexPath.row].numberOfUnits)=\(productDescriptionData[indexPath.row].totalSum)"
    cell.contentConfiguration = content
    return cell
  }
}
