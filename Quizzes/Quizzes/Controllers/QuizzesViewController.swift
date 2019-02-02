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
  private var quizzes = [SearchQuiz]()
  private var quizAPIClient = QuizAPIClient()
    override func viewDidLoad() {
      super.viewDidLoad()
      setupDelegates()
      setupUI()
//      quizAPIClient.fetchQuizzes()
    }
  
  convenience init(sessionManager:SessionManager, quizManager:QuizManager){
    self.init()
    self.quizManager = quizManager
    self.sessionManager = sessionManager
  }
  
  private func setupDelegates(){
    quizView.quizCollection.dataSource = self
    quizView.quizCollection.delegate = self
    quizAPIClient.delegate = self
  }
  
  private func setupUI(){
    if quizzes.count == 0 {
      let blankView = BlankView()
      blankView.textView.text = "Please add quizzes"
      view = blankView
    } else {
      view = quizView
    }
    navigationItem.title = "My Quizzes"
  }

}

extension QuizzesViewController: UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = quizView.quizCollection.dequeueReusableCell(withReuseIdentifier: "SearchQuizCell", for: indexPath) as? SearchQuizCell else { fatalError("") }
    let quiz = quizzes[indexPath.row]
    cell.configureCell(quiz:quiz, imageName: "more-filled")
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

extension QuizzesViewController: QuizAPIClientDelegate {
  func quizAPIClient(_ quizAPIClient: QuizAPIClient, didReceiveData quizzes: [SearchQuiz]) {
    self.quizzes = quizzes
    DispatchQueue.main.async {
      self.quizView.quizCollection.reloadData()
    }
  }
  
  func quizAPIClient(_ quizAPIClient: QuizAPIClient, didReceiveError error: AppError) {
    
  }
}

extension QuizzesViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let quiz = quizzes[indexPath.row]
    let quizVC = QuizViewController(quiz:quiz)
    navigationController?.pushViewController(quizVC, animated: true)
  }
}
