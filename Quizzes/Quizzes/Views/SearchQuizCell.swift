//
//  QuizViewCell.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchQuizCell: UICollectionViewCell {
  public lazy var label: UILabel = {
    let label = UILabel()
    return label
  }()
  
  public lazy var quizButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "add-icon"), for: .normal)
//    button.backgroundColor = .black
    return button
  }()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    self.backgroundColor = .red
    setupAddButton()
    setupQuizLabel()
  }
  
  private func setupAddButton(){
    addSubview(quizButton)
    quizButton.translatesAutoresizingMaskIntoConstraints = false
    quizButton.heightAnchor.constraint(equalTo:contentView.heightAnchor, multiplier: 0.20).isActive = true
    quizButton.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.25).isActive = true
    quizButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    quizButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
  }
  
  private func setupQuizLabel(){
    addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
    label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
    label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
  }
  
  public func configureCell(quiz:QuizProtocol,imageName:String){
    label.text = quiz.quizTitle
    quizButton.setImage(UIImage(named: imageName), for: .normal)
  }
  
}
