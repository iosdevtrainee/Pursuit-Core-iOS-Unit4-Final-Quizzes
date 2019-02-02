//
//  BlankView.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class BlankView: UIView {
  public lazy var textView: UITextView = {
    let tv = UITextView()
    tv.textColor = .black
    tv.font = UIFont(descriptor: UIFontDescriptor.init(), size: 20)
    tv.textAlignment = .center
    tv.isUserInteractionEnabled = false
    return tv
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
  }
  
  private func setupView(){
    setupTextView()
  }
  
  private func setupTextView(){
    addSubview(textView)
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
    textView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
    textView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    textView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
  }
  
  
}
