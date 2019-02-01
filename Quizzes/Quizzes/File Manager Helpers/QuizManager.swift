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
  public func saveQuiz(quiz:Quiz) -> Bool {
    var quizzes = getQuizzes()
    let url = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
    quizzes.append(quiz)
    do {
      let data = try PropertyListEncoder().encode(quizzes)
      do {
        try data.write(to: url, options:.atomic)
      } catch {
        print(error)
        return false
      }
    } catch {
      print(error)
      return false
    }
    return true
  }
  
  public func getQuizzes() -> [Quiz] {
    var quizzes = [Quiz]()
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path) {
        do {
          quizzes = try PropertyListDecoder().decode([Quiz].self, from: data)
        } catch {
          print(error)
        }
      }
    }
    return quizzes
  }
}
