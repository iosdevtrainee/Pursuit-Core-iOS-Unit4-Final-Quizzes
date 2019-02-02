//
//  Quiz.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

protocol QuizProtocol {
  var quizTitle: String { get set }
  var facts: [String] { get set }
}

struct Quiz: Codable, QuizProtocol {
  var quizTitle: String
  public let id: UUID
  public var createdAt: String {
    let dateFormmater = DateFormatter()
    dateFormmater.dateFormat = "MM/DD/YY"
    return dateFormmater.string(from: creationDate)
  }
  public let creationDate: Date
  public var facts: [String]
}

struct SearchQuiz: Codable, QuizProtocol {
  public let id: String
  public var quizTitle: String
  public var facts: [String]
}
