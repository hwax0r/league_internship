//
//  StocksService.swift
//  10_NSURLSession
//
//  Created by David Sergeev on 22.03.2022.
//

import Foundation

protocol StocksServiceProtocol: AnyObject {
  func fetchListOfCompanies(completion: @escaping (Swift.Result<[CompanyRaw], Error>) -> Void)
}

class StocksService {
  private let network = NetworkCore.instance
}

extension StocksService: StocksServiceProtocol {
  func fetchListOfCompanies(completion: @escaping (Swift.Result<[CompanyRaw], Error>) -> Void) {
    let metadata = "stable/stock/market/list/mostactive"
    network.request(metadata: metadata,
                    completion: { (result: CoreResult<ListOfCompaniesResponse>) in
      switch result {
      case .success(let responses):
        completion(.success(responses.array))
      case .failure(let error):
        completion(.failure(error))
      }
    })
  }
}
