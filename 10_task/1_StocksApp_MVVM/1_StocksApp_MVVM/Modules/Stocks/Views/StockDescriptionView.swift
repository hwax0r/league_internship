//
//  StockDescriptionView.swift
//  1_StocksApp_MVVM
//
//  Created by David Sergeev on 26.03.2022.
//

import UIKit

final class StockDescriptionView: UIView {
  let textFont = UIFont.systemFont(ofSize: 17, weight: .bold)
  let valueFont = UIFont.systemFont(ofSize: 17, weight: .regular)

  var viewModel: ViewModel? {
    didSet {
      guard viewModel != oldValue,
            let viewModel = viewModel else { return }

      companyNameValueLabel.text = viewModel.companyName
      symbolValueLabel.text = viewModel.companyStockSymbol
      priceValueLabel.text = viewModel.stockPrice
      priceChangeValueLabel.text = viewModel.stockPriceChange

//      setNeedsLayout()
      layoutIfNeeded()
    }
  }

  private lazy var companyNameTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Company name"
    label.font = textFont
    label.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 187
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private lazy var companyNameValueLabel: UILabel = {
    let label = UILabel()
    label.text = "not loaded yet"
    label.font = valueFont
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var symbolTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Symbol"
    label.font = textFont
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private lazy var symbolValueLabel: UILabel = {
    let label = UILabel()
    label.text = "not loaded yet"
    label.font = valueFont
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var priceTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Price"
    label.font = textFont
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private lazy var priceValueLabel: UILabel = {
    let label = UILabel()
    label.text = "not loaded yet"
    label.font = valueFont
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var priceChangeTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Price change"
    label.font = textFont
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private lazy var priceChangeValueLabel: UILabel = {
    let label = UILabel()
    label.text = "not loaded yet"
    label.font = valueFont
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.translatesAutoresizingMaskIntoConstraints = false

    configureView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

// MARK: - Private methods
extension StockDescriptionView {
  private func configureView() {
    addSubviews([
      companyNameTextLabel,
      companyNameValueLabel,
      symbolTextLabel,
      symbolValueLabel,
      priceTextLabel,
      priceValueLabel,
      priceChangeTextLabel,
      priceChangeValueLabel,
    ])

    let bottomOffset: CGFloat = 10
    NSLayoutConstraint.activate([
      companyNameTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      companyNameTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      companyNameTextLabel.trailingAnchor.constraint(equalTo: companyNameTextLabel.leadingAnchor, constant: 128),

      companyNameValueLabel.topAnchor.constraint(equalTo: companyNameTextLabel.topAnchor),
      companyNameValueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: companyNameTextLabel.trailingAnchor, constant: 20),
      companyNameValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      symbolTextLabel.topAnchor.constraint(equalTo: companyNameTextLabel.bottomAnchor, constant: bottomOffset),
      symbolTextLabel.leadingAnchor.constraint(equalTo: companyNameTextLabel.leadingAnchor),
      symbolTextLabel.bottomAnchor.constraint(equalTo: symbolValueLabel.bottomAnchor),

      symbolValueLabel.topAnchor.constraint(equalTo: symbolTextLabel.topAnchor),
      symbolValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      priceTextLabel.topAnchor.constraint(equalTo: symbolTextLabel.bottomAnchor, constant: bottomOffset),
      priceTextLabel.leadingAnchor.constraint(equalTo: companyNameTextLabel.leadingAnchor),
      priceTextLabel.bottomAnchor.constraint(equalTo: priceValueLabel.bottomAnchor),

      priceValueLabel.topAnchor.constraint(equalTo: priceTextLabel.topAnchor),
      priceValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

      priceChangeTextLabel.topAnchor.constraint(equalTo: priceTextLabel.bottomAnchor, constant: bottomOffset),
      priceChangeTextLabel.leadingAnchor.constraint(equalTo: companyNameTextLabel.leadingAnchor),
      priceChangeTextLabel.bottomAnchor.constraint(equalTo: priceChangeValueLabel.bottomAnchor),

      priceChangeValueLabel.topAnchor.constraint(equalTo: priceChangeTextLabel.topAnchor),
      priceChangeValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
    ])
  }
}

// MARK: - ViewModel
extension StockDescriptionView {
  struct ViewModel: Equatable {
    let companyName: String
    let companyStockSymbol: String
    let stockPrice: String
    let stockPriceChange: String

    init(from model: StockDescriptionModel) {
      companyName = model.companyName
      companyStockSymbol = model.symbol
      stockPrice = model.closePrice
      stockPriceChange = model.priceChange
    }
  }
}
