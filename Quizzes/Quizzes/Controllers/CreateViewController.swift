//
//  CreateViewController.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
  private var sessionManager: SessionManager!
  private var quizManager: QuizManager!
  private var createView = CreateView()
  
  convenience init(sessionManager:SessionManager, quizManager: QuizManager){
    self.init()
    self.sessionManager = sessionManager
    self.quizManager = quizManager
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavBar()
    if sessionManager.isLoggedIn {
        view = createView
    } else {
      showAlert(title: "Unable to access this page", message: "Please Login", actionMsg:"Cancel")
    }
  }
  
  private func setupNavBar() {
    navigationItem.title = "Create Quiz"
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissView))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(addQuiz))
  }
  
  @objc private func dismissView(){
    dismiss(animated: true, completion: nil)
  }
  
  @objc private func addQuiz(){
    guard let quizTitle = createView.quizTextField.text,
      let factOne = createView.firstDescriptionTextView.text,
      let factTwo = createView.secondDescriptionTextView.text,
      !quizTitle.isEmpty && !factTwo.isEmpty && !factOne.isEmpty else {
        showAlert(title: "Invalid Input", message: "No field should be left blank.", actionMsg: "Cancel")
        return
    }
    
    let date = Date()
    let id = UUID()
    let quiz = Quiz(quizTitle: quizTitle, id:id, creationDate: date, facts: [factOne,factTwo])
    do {
      try quizManager.saveQuiz(quiz: quiz)
    } catch {
      showAlert(title: "Save Error", message: error.localizedDescription, actionMsg: "Cancel")
    }
    showAlert(title: "Success", message:"Quiz saved successfully." , actionMsg: "Done")
  }
  
}
