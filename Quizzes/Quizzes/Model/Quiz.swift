//
//  Quiz.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
struct Quiz: Codable {
  public let name: String
  public var createdAt: String {
    let dateFormmater = DateFormatter()
    dateFormmater.dateFormat = "MM/DD/YY"
    return dateFormmater.string(from: creationDate)
  }
  public let creationDate: Date
  public let descriptionOne: String
  public let descriptionTwo: String
}
