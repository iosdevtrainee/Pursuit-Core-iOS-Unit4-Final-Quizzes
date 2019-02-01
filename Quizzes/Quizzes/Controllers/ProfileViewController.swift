//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var imagePickerController = UIImagePickerController()
    private let alertController = UIAlertController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
  
  private func setupView() {
    let profileView = ProfileView()
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: #selector(takePhoto))
    setupTapGesture(profileView: profileView)
    createActionSheet()
    view = profileView
    navigationItem.title = "Profile"
  }
  
  private func setupTapGesture(profileView: ProfileView) {
    let tapGestureRecognizer = UITapGestureRecognizer()
    tapGestureRecognizer.addTarget(self , action: #selector(showActionSheet))
    profileView.profileImage.addGestureRecognizer(tapGestureRecognizer)
  }
  
  private func createActionSheet() {
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (alertAction) in
      
    }
    [photoLibraryAction,cancelAction].forEach { alertController.addAction($0) }
  }
  
  
  @objc private func showActionSheet(){
    present(alertController, animated: true, completion: nil)
  }
  
  @objc private func takePhoto() {
    
  }

}
