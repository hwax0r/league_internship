//
//  NetworkCore.swift
//  10_NSURLSession
//
//  Created by David Sergeev on 22.03.2022.
//

import Foundation

typealias CoreResult<T: Responsable> = Swift.Result<T, NetworkError>

protocol NetworkCoreProtocol {
  func request<Res: Responsable>(metadata: String,
                                 completion: @escaping (CoreResult<Res>) -> Void)
}


class NetworkCore {

  static let instance: NetworkCoreProtocol = NetworkCore()

  private let token = "pk_9126de53050040c1b737ead7a0720727"
  private let url = "https://cloud.iexapis.com/"
  private let jsonDecoder = JSONDecoder()

}

extension NetworkCore: NetworkCoreProtocol {
  func request<Res: Responsable>(metadata: String,
                                 completion: @escaping (CoreResult<Res>) -> Void) {
    let urlRequest = URL(string: "\(url)/\(metadata)?token=\(token)")

    guard let url = urlRequest else {
      completion(.failure(NetworkError.invalidURL))
      return
    }

    let dataTask = URLSession
      .shared
      .dataTask(with: url,
                completionHandler: { (data, response, error) in
        if let data = data,
           (response as? HTTPURLResponse)?.statusCode == 200,
           error == nil {
          self.handleSuccessDataResponse(data, completion: completion)
        } else {
          print("Add processing for error. with help NetworkError")
        }
      })
    dataTask.resume()
  }
}

// MARK: - Data decoding
extension NetworkCore {
  private func handleSuccessDataResponse<Res: Responsable>(_ data: Data, completion: (CoreResult<Res>) -> Void) {
    do {
      completion(.success(try decodeData(data: data)))
    } catch {
      completion(.failure(.responseDecodingError))
    }
  }

  private func decodeData<Res: Responsable>(data: Data) throws -> Res {
//    let json = try JSONSerialization.jsonObject(with: data)
////    print(json)
    let response = try jsonDecoder.decode(Res.self, from: data)
    return response
  }
}
