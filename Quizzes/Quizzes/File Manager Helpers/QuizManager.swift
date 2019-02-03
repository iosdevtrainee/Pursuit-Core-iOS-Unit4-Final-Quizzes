//
//  QuizManager.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
struct QuizManager {
  public let filename: String
  @discardableResult
  public func saveQuiz(quiz:Quiz) throws -> Bool {
    guard var quizzes = try? getQuizzes() else { return false }
    guard !quizzes.contains (where: { $0.quizTitle.lowercased() == quiz.quizTitle.lowercased()
      && $0.facts.map { $0.lowercased() } == quiz.facts.map { $0.lowercased() } }) else {
        throw AppError.badStatusCode("Duplicate Quiz")
    }
    quizzes.append(quiz)
    return try saveQuizzes(quizzes: quizzes)
  }
  
  private func saveQuizzes(quizzes:[Quiz]) throws -> Bool{
    let url = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
    do {
      let data = try PropertyListEncoder().encode(quizzes)
      do {
        try data.write(to: url, options:.atomic)
      } catch {
        throw error
      }
    } catch {
      throw error
    }
    return true
  }
  
  public func getQuizzes() throws -> [Quiz] {
    var quizzes = [Quiz]()
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path) {
        do {
          quizzes = try PropertyListDecoder().decode([Quiz].self, from: data)
        } catch {
          throw AppError.propertyListEncodingError(error)
        }
      }
    }
    return quizzes
  }
  
  @discardableResult
  public func deleteQuiz(quiz:Quiz) throws -> Bool{
    guard var quizzes = try? getQuizzes() else { return false }
    guard let index = (quizzes.firstIndex { quiz.id == $0.id }) else { return false }
    quizzes.remove(at: index)
    return try saveQuizzes(quizzes: quizzes)
  }
}
