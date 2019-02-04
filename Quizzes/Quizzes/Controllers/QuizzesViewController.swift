//
//  QuizzesViewController.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzesViewController: UIViewController {
  private var sessionManager: SessionManager!
  private var quizManager: QuizManager!
  private lazy var quizView = QuizzesView()
  private var quizzes = [Quiz]() {
    didSet {
      quizView.quizCollection.reloadData()
    }
  }
  
  convenience init(sessionManager:SessionManager, quizManager:QuizManager){
    self.init()
    self.quizManager = quizManager
    self.sessionManager = sessionManager
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupDelegates()
    fetchQuizzes(quizManager: quizManager)
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    fetchQuizzes(quizManager: quizManager)
  }
  
  private func setupDelegates(){
    quizView.quizCollection.dataSource = self
    quizView.quizCollection.delegate = self
  }
  
  private func setupUI(){
    if quizzes.count == 0 && sessionManager.isLoggedIn {
      let blankView = BlankView()
      blankView.textView.text = "Login and add quizzes"
      view = blankView
    } else {
      view = quizView
    }
    navigationItem.title = "My Quizzes"
  }
  
  
  private func fetchQuizzes(quizManager:QuizManager){
    if let savedQuizzes = try? quizManager.getQuizzes(){
      quizzes = savedQuizzes
    }
  }
  private func createDeleteAction(quiz:Quiz, indexToDelete:Int) -> UIAlertAction {
    return UIAlertAction(title: "Delete", style: .destructive) { (alertAction) in
      do {
        try self.quizManager.deleteQuiz(quiz: quiz)
      } catch {
        let appError = error as! AppError
        self.showAlert(title: "Deletion Error", message: appError.errorMessage(), actionMsg: "Cancel")
      }
      
      self.quizzes.remove(at: indexToDelete)
    }
  }

  @objc private func showOptions(_ sender:UIButton){
    let indexToDelete = sender.tag
    let quiz = quizzes[indexToDelete]
    let quizOptionsController = UIAlertController()
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    let deleteAction = createDeleteAction(quiz: quiz, indexToDelete: indexToDelete)
    [deleteAction, cancelAction].forEach { quizOptionsController.addAction($0)}
    present(quizOptionsController, animated: true, completion: nil)
  }
  
}

extension QuizzesViewController: UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = quizView.quizCollection.dequeueReusableCell(withReuseIdentifier: "SearchQuizCell", for: indexPath) as? SearchQuizCell else { fatalError("") }
    let quiz = quizzes[indexPath.row]
    cell.tag = indexPath.row
    cell.configureCell(quiz:quiz, imageName: "more-filled", selector: #selector(showOptions(_:)), sender: self)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return quizzes.count
  }
}
extension QuizzesViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height
      / 3)
  }
}

extension QuizzesViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let quiz = quizzes[indexPath.row]
    let quizVC = QuizViewController(quiz:quiz)
    navigationController?.pushViewController(quizVC, animated: true)
  }
}
