//
//  QuizViewController.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
  private let quizView = QuizView()
  private var quiz: QuizProtocol!
  override func viewDidLoad() {
    super.viewDidLoad()
    view = quizView
    quizView.quizCollection.dataSource = self
    quizView.quizCollection.delegate = self
  }
  
  convenience init(quiz:QuizProtocol){
    self.init()
    self.quiz = quiz
  }
  
}

extension QuizViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cell = collectionView.cellForItem(at: indexPath) as? QuizFlipCell else { return }
    let fact = quiz.facts[indexPath.row]
    if cell.label.text == fact {
      UIView.transition(with: cell, duration: 1.0, options: [.transitionFlipFromRight], animations: {
        cell.label.text = self.quiz.quizTitle
      })
    } else {
      UIView.transition(with: cell, duration: 1.0, options: [.transitionFlipFromLeft], animations: {
        cell.label.text = fact
      })
    }
  }
}

extension QuizViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return quiz.facts.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = quizView.quizCollection.dequeueReusableCell(withReuseIdentifier: "QuizFlipCell", for: indexPath) as? QuizFlipCell else { fatalError("")}
    cell.label.text = quiz.quizTitle
    return cell
  }
}

extension QuizViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
  }
}
