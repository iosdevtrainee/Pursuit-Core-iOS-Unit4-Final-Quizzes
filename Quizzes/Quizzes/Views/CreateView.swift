//
//  CreateView.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateView: UIView {
  public lazy var firstDescriptionTextView: UITextView = {
    let tv = UITextView()
    tv.backgroundColor = .blue
    return tv
  }()
  public lazy var secondDescriptionTextView: UITextView = {
    let tv = UITextView()
    tv.backgroundColor = .red
    return tv
  }()
  
  public lazy var quizTextField: UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .white
    return tf
  }()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupView()
    backgroundColor = .white
    layer.borderColor = UIColor.blue.cgColor
    layer.borderWidth = 2
  }
  
  private func setupView(){
   setupTextField()
   setupFirstTextView()
   setupSecondTextView()
  }
  
  private func setupTextField(){
    addSubview(quizTextField)
    quizTextField.translatesAutoresizingMaskIntoConstraints = false
    quizTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    quizTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.95).isActive = true
    quizTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    quizTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
  }
  
  private func setupFirstTextView(){
    addSubview(firstDescriptionTextView)
    firstDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
    firstDescriptionTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
    firstDescriptionTextView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.95).isActive = true
    firstDescriptionTextView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    firstDescriptionTextView.topAnchor.constraint(equalTo: quizTextField.bottomAnchor, constant: 10).isActive = true
  }
  
  private func setupSecondTextView(){
    addSubview(secondDescriptionTextView)
    secondDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
    secondDescriptionTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
    secondDescriptionTextView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.95).isActive = true
    secondDescriptionTextView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    secondDescriptionTextView.topAnchor.constraint(equalTo: firstDescriptionTextView.bottomAnchor, constant: 10).isActive = true
  }
  
}
