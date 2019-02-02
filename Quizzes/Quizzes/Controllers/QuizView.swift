//
//  QuizView.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizView: UIView {
  public lazy var quizCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let quizCollection = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
    quizCollection.register(QuizFlipCell.self, forCellWithReuseIdentifier: "QuizFlipCell")
    quizCollection.backgroundColor = .white
    return quizCollection
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func layoutSubviews() {
    backgroundColor = .green
    setupViews()
  }
  
  private func setupViews(){
    setupQuizCollection()
  }
  
  private func setupQuizCollection(){
    addSubview(quizCollection)
    quizCollection.translatesAutoresizingMaskIntoConstraints = false
    quizCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    quizCollection.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
    quizCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
  
}
