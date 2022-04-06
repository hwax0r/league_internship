//
//  NetworkError.swift
//  1_StocksApp_MVVM
//
//  Created by David Sergeev on 26.03.2022.
//

import Foundation

enum NetworkError: Error {
  case invalidURL
  case responseDecodingError
  case redirectionError
  case clientError
  case serverError
  case unexpectedResponseError
}
