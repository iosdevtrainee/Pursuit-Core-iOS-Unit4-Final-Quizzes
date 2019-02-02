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
    view = createView
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
//    guard let descriptionOne = quizView.
  }
}
