//
//  NetworkError.swift
//  10_NSURLSession
//
//  Created by David Sergeev on 24.03.2022.
//

import Foundation

enum NetworkError: Error {
  case invalidURL
  case responseDecodingError
}
