//
//  TeamMemberModel.swift
//  8_UITableViewCodingSession
//
//  Created by David Sergeev on 15.03.2022.
//

import Foundation

struct TeamMemberModel: CustomStringConvertible {
  var name: String
  var surname: String

  var description: String {
    return "\(surname) \(name)"
  }
}
