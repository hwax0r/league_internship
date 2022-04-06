//
//  MainViewController.swift
//  1_StocksApp_MVVM
//
//  Created by David Sergeev on 26.03.2022.
//

import UIKit

class MainViewController: UIViewController {
  private let stocksService = StocksService()
  private var stocks: [CompanyRaw] = []

  private let stockDescriptionView = StockDescriptionView()
  private lazy var companyPicker: UIPickerView = {
    let picker = UIPickerView()
    picker.dataSource = self
    picker.delegate = self
    picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    stockDescriptionView.backgroundColor = .systemBackground
    configureView()

    companyPicker.isHidden = true

    tryLoadDataOnTopStocks()
  }
}

// MARK: - Private methods
extension MainViewController {
  private func configureView() {
    view.addSubviews([
      stockDescriptionView,
      companyPicker,
    ])

    NSLayoutConstraint.activate([
      stockDescriptionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      stockDescriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      stockDescriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      stockDescriptionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height/2),

      companyPicker.topAnchor.constraint(equalTo: stockDescriptionView.bottomAnchor),
      companyPicker.leadingAnchor.constraint(equalTo: stockDescriptionView.leadingAnchor),
      companyPicker.trailingAnchor.constraint(equalTo: stockDescriptionView.trailingAnchor),
      companyPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension MainViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    stocks.count
  }
}

extension MainViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    stocks[row].companyName
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let selectedCompany = stocks[row]
    tryLoadDataOnCompany(selectedCompany: selectedCompany)
  }
}


// MARK: - Private methods
extension MainViewController {
  private func showNetworkErrorAlert(message: String, completion: (() -> Void)?) {
    let alertController = UIAlertController(title: "Network Error",
                                            message: message,
                                            preferredStyle: .alert)
    let tryLoadDataAction = UIAlertAction(title: "Try again",
                                          style: .default,
                                          handler: nil)
    alertController.addAction(tryLoadDataAction)
    self.present(alertController, animated: true, completion: completion)
  }

  private func tryLoadDataOnCompany(selectedCompany: CompanyRaw) {
    stocksService.fetchStockData(stock: selectedCompany,
                                 completion: { [weak self] result in
      guard let self = self else { return }

      switch result {
      case .success(let response):
        let model = StockDescriptionModel(from: response)
        DispatchQueue.main.async {
          self.stockDescriptionView.viewModel = StockDescriptionView.ViewModel(from: model)
        }
      case .failure(let error):
        print("tryLoadDataOnCompany: \(error)")
        DispatchQueue.main.async {
          self.showNetworkErrorAlert(message: String.init(describing: error), completion: { [weak self] in
            guard let self = self else { return }
            self.tryLoadDataOnCompany(selectedCompany: selectedCompany)
          })
        }
      }
    })
  }

  private func tryLoadDataOnTopStocks() {
    stocksService.fetchListOfCompanies(completion: { [weak self] result in
      guard let self = self else { return }

      switch result {
      case .success(let response):

        self.stocks = response.sorted(by: { $0.companyName < $1.companyName })
        DispatchQueue.main.async { [weak self] in
          guard let self = self else { return }

          self.companyPicker.reloadAllComponents()

          let selectedRow = self.stocks.count / 2
          self.companyPicker.selectRow(selectedRow, inComponent: 0, animated: false)
          self.companyPicker.delegate?.pickerView?(self.companyPicker, didSelectRow: selectedRow, inComponent: 0)
        }
        self.companyPicker.fadeIn()
      case .failure(let error):
        print("tryLoadDataOnTopStocks: \(error)")
        DispatchQueue.main.async {
          self.showNetworkErrorAlert(message: String.init(describing: error), completion: { [weak self] in
            guard let self = self else { return }
            self.tryLoadDataOnTopStocks()
          })
        }
      }
    })
  }
}

