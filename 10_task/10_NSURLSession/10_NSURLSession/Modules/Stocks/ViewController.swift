//
//  ViewController.swift
//  10_NSURLSession
//
//  Created by David Sergeev on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {
  private var data: [CompanyRaw] = []
  private let stocksService = StocksService()

  private lazy var companyNameTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Company name"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private lazy var companyNameValueLabel: UILabel = {
    let label = UILabel()
    label.text = "SomeCompany"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var symbolTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Symbol"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private lazy var symbolValueLabel: UILabel = {
    let label = UILabel()
    label.text = "SomeSymbol"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var priceTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Price"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private lazy var priceValueLabel: UILabel = {
    let label = UILabel()
    label.text = "SomePrice"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var priceChangeTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Price change"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private lazy var priceChangeValueLabel: UILabel = {
    let label = UILabel()
    label.text = "SomePriceChange"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var reloadDataActivityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.style = .medium
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    return activityIndicator
  }()

  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()

  private lazy var stockCompanyPicker: UIPickerView = {
    let picker = UIPickerView()
    picker.dataSource = self
    picker.delegate = self
    picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
  }()

  private lazy var informationView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemMint
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    stocksService.fetchListOfCompanies(completion: { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .success(let raws):
        print("ViewController success")
        self.data = raws

        DispatchQueue.main.async {
          self.stockCompanyPicker.reloadAllComponents()
        }
      case .failure(let error):
        print("ViewController error")
        print(error)
      }
    })

    view.backgroundColor = .red
    configureView()
  }


}

// MARK: - Private methods
extension ViewController {
  func configureView() {
    view.addSubview(informationView)
    view.addSubview(reloadDataActivityIndicator)
    view.addSubview(stockCompanyPicker)

    informationView.addSubview(companyNameTextLabel)
    informationView.addSubview(companyNameValueLabel)
    informationView.addSubview(symbolTextLabel)
    informationView.addSubview(symbolValueLabel)
    informationView.addSubview(priceTextLabel)
    informationView.addSubview(priceValueLabel)
    informationView.addSubview(priceChangeTextLabel)
    informationView.addSubview(priceChangeValueLabel)


    NSLayoutConstraint.activate([
      informationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

      companyNameTextLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 20),
      companyNameTextLabel.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 20),

      companyNameValueLabel.topAnchor.constraint(equalTo: companyNameTextLabel.topAnchor),
      companyNameValueLabel.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -20),

      symbolTextLabel.topAnchor.constraint(equalTo: companyNameTextLabel.bottomAnchor, constant: 10),
      symbolTextLabel.leadingAnchor.constraint(equalTo: companyNameTextLabel.leadingAnchor),

      symbolValueLabel.topAnchor.constraint(equalTo: symbolTextLabel.topAnchor),
      symbolValueLabel.trailingAnchor.constraint(equalTo: companyNameValueLabel.trailingAnchor),

      priceTextLabel.topAnchor.constraint(equalTo: symbolTextLabel.bottomAnchor, constant: 10),
      priceTextLabel.leadingAnchor.constraint(equalTo: companyNameTextLabel.leadingAnchor),

      priceValueLabel.topAnchor.constraint(equalTo: priceTextLabel.topAnchor),
      priceValueLabel.trailingAnchor.constraint(equalTo: companyNameValueLabel.trailingAnchor),

      priceChangeTextLabel.topAnchor.constraint(equalTo: priceTextLabel.bottomAnchor, constant: 10),
      priceChangeTextLabel.leadingAnchor.constraint(equalTo: companyNameTextLabel.leadingAnchor),

      priceChangeValueLabel.topAnchor.constraint(equalTo: priceChangeTextLabel.topAnchor),
      priceChangeValueLabel.trailingAnchor.constraint(equalTo: companyNameValueLabel.trailingAnchor),

      stockCompanyPicker.topAnchor.constraint(equalTo: informationView.bottomAnchor, constant: 20),
      stockCompanyPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      stockCompanyPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      stockCompanyPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
    ])
  }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    data.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return data[row].companyName
  }
}
