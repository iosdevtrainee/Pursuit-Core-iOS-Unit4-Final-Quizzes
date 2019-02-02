//
//  User.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
struct User:Codable {
  public let name:String
  public let quizzes: [Quiz]
  public let profileImage: Data
}
