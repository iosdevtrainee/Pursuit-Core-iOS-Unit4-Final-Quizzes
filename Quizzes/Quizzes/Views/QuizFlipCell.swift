//
//  QuizFlipCell.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizFlipCell: UICollectionViewCell {
  public lazy var label: UILabel = {
    let label = UILabel()
    label.numberOfLines = 5
    label
    return label
  }()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    self.backgroundColor = .red
    setupQuizLabel()
  }
  
  private func setupQuizLabel(){
    addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
    label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
    label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
  }
  
  public func configureCell(quiz:QuizProtocol,imageName:String){
    label.text = quiz.quizTitle
  }
}
