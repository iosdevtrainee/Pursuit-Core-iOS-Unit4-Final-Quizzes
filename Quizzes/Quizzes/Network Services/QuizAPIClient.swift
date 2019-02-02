//
//  QuizAPIClient.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
protocol QuizAPIClientDelegate: AnyObject {
  func quizAPIClient(_ quizAPIClient:QuizAPIClient, didReceiveData quizzes:[SearchQuiz])
  func quizAPIClient(_ quizAPIClient:QuizAPIClient, didReceiveError error:AppError)
}

final class QuizAPIClient {
  public weak var delegate: QuizAPIClientDelegate?
  public func fetchQuizzes(){
    let urlString = "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes"
    NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
      if let error = error {
        self.delegate?.quizAPIClient(self, didReceiveError: error)
      }
      
      if let data = data {
        do {
            let quizzes = try JSONDecoder().decode([SearchQuiz].self, from: data)
            self.delegate?.quizAPIClient(self, didReceiveData: quizzes)
        } catch {
          self.delegate?.quizAPIClient(self, didReceiveError: AppError.jsonDecodingError(error))
        }
        
      }
    }
  }
  
}
