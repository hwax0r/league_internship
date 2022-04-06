//
//  StocksService.swift
//  1_StocksApp_MVVM
//
//  Created by David Sergeev on 26.03.2022.
//

import Foundation

protocol StocksServiceProtocol: AnyObject {
  func fetchListOfCompanies(completion: @escaping (Swift.Result<[CompanyRaw], NetworkError>) -> Void)
  func fetchStockData(stock: CompanyRaw,
                      completion: @escaping (Swift.Result<StockDescriptionResponse, NetworkError>) -> Void)
}

final class StocksService {
  private let network = NetworkCore.instance
}

// MARK: - StocksServiceProtocol
extension StocksService: StocksServiceProtocol {
  func fetchListOfCompanies(completion: @escaping (Result<[CompanyRaw], NetworkError>) -> Void) {
    let metadata = "stable/stock/market/list/mostactive"
    network.request(metadata: metadata,
                    completion: { (result: CoreResult<ListOfCompaniesResponse>) in
      switch result {
      case .success(let response):
        completion(.success(response.array))
      case .failure(let error):
        completion(.failure(error))
      }
    })
  }

  func fetchStockData(stock: CompanyRaw,
                      completion: @escaping (Swift.Result<StockDescriptionResponse, NetworkError>) -> Void) {
    let metadata = "stable/stock/\(stock.symbol)/quote"
    network.request(metadata: metadata,
                    completion: { (result: CoreResult<StockDescriptionResponse>) in
      
      switch result {
      case .success(let response):
        completion(.success(response))
      case .failure(let error):
        completion(.failure(error))
      }
    })
  }
}


