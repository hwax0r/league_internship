//
//  TeamModel.swift
//  8_UITableViewCodingSession
//
//  Created by David Sergeev on 15.03.2022.
//

import Foundation

class TeamModel: CustomStringConvertible {
  var name: String
  var teamMembers: [TeamMemberModel] {
    didSet {
      self.teamMembers.sort(by: { $0.name > $1.name })
    }
  }

  init(name: String, teamMembers: [TeamMemberModel]) {
    self.name = name
    self.teamMembers = teamMembers
  }
  var description: String {
    return "\(name): \(teamMembers.description) \n"
  }
}
