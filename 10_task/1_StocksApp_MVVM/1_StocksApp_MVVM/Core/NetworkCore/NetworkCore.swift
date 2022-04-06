//
//  NetworkCore.swift
//  1_StocksApp_MVVM
//
//  Created by David Sergeev on 26.03.2022.
//

import Foundation

typealias CoreResult<T: Responsable> = Swift.Result<T, NetworkError>

protocol NetworkCoreProtocol {
  func request<Res: Responsable>(metadata: String,
                                              completion: @escaping (CoreResult<Res>) -> Void)
}

final class NetworkCore {
  static let instance: NetworkCoreProtocol = NetworkCore()

  private let url = "https://cloud.iexapis.com/"
  private let token = "pk_9126de53050040c1b737ead7a0720727"
  private let jsonDecoder = JSONDecoder()
}

// MARK: - NetworkCoreProtocol
extension NetworkCore: NetworkCoreProtocol {
  func request<Res: Responsable>(metadata: String,
                                 completion: @escaping (CoreResult<Res>) -> Void) {
    let urlRequest = URL(string: "\(url)/\(metadata)?token=\(token)")

    guard let url = urlRequest else {
      completion(.failure(.invalidURL))
      return
    }

    let dataTask = URLSession
      .shared
      .dataTask(with: url,
                completionHandler: { (data, response, error) in
//        let response = HTTPURLResponse.init(url: URL(string: "google.com")!,
//                                            statusCode: 400,
//                                            httpVersion: nil,
//                                            headerFields: nil)
//        print((response as? HTTPURLResponse)?.statusCode ?? "nil")
        // TODO: обернуть ответ в DispatchQueue.main.async
        if let data = data,
           (response as? HTTPURLResponse)?.statusCode == 200,
           error == nil {
          self.handleSuccessDataResponse(data, completion: completion)
        } else {
          guard let responseCode = (response as? HTTPURLResponse)?.statusCode else {
            completion(.failure(.unexpectedResponseError))
            return
          }

          switch responseCode {
          case 300..<400:
            completion(.failure(.redirectionError))
          case 400..<500:
            completion(.failure(.clientError))
          case 500..<600:
            completion(.failure(.serverError))
          default:
            completion(.failure(.unexpectedResponseError))
          }
        }
      })
    dataTask.resume()
  }

}

// MARK: - Data decoding
extension NetworkCore {
  private func handleSuccessDataResponse<Res: Responsable>(_ data: Data,
                                                           completion: (CoreResult<Res>) -> Void) {
    do {
      completion(.success(try decodeData(data: data)))
    } catch {
      completion(.failure(.responseDecodingError))
    }
  }

  private func decodeData<Res: Responsable>(data: Data) throws -> Res {
    let response = try jsonDecoder.decode(Res.self, from: data)
    return response
  }
}
