//
//  ProfileView.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileView: UIView {
  public lazy var profileImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "baby")
    imageView.isUserInteractionEnabled = true
    imageView.clipsToBounds = true
    return imageView
  }()
  
  public lazy var profileNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Some Text"
    label.textAlignment = .center
//    label.textColor = UIColor(
    return label
  }()
  
  private lazy var profileView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
    return view
  }()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupViews()
//    profileView.layer.cornerRadius = profileView.bounds.width / 2
  }
  
  private func setupViews(){
    setupProfileView()
    setupProfileImage()
    setupProfileLabel()
  }
  
  private func setupProfileView(){
    addSubview(profileView)
    profileView.translatesAutoresizingMaskIntoConstraints = false
    profileView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    profileView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    profileView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
    profileView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
  }
  
  private func setupProfileLabel() {
    profileView.addSubview(profileNameLabel)
    profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
    profileNameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
    profileNameLabel.widthAnchor.constraint(equalTo: profileView.widthAnchor, multiplier: 1.0).isActive = true
    profileNameLabel.heightAnchor.constraint(equalTo: profileView.heightAnchor, multiplier: 0.1, constant: 0).isActive = true
    
  }
  private func setupProfileImage(){
    profileView.addSubview(profileImage)
    profileImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: profileImage, attribute: .centerY, relatedBy: .equal, toItem: profileView, attribute: .centerY, multiplier: 0.6, constant: 0).isActive = true
    NSLayoutConstraint(item: profileImage, attribute: .centerX, relatedBy: .equal, toItem: profileView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
    profileImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
    profileImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
    
  }
}
