//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
import AVFoundation
class ProfileViewController: UIViewController {
  private var sessionManager: SessionManager!
  private lazy var imagePickerController = UIImagePickerController()
  private let profileView = ProfileView()
  private let actionSheetController = UIAlertController()
  
  convenience init(sessionManager:SessionManager){
    self.init()
    self.sessionManager = sessionManager
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    showLogin()
  }
  
  
  private func setupView() {
    setupTapGesture(profileView: profileView)
    createActionSheet()
    view = profileView
    navigationItem.title = "Profile"
    
  }
  
  private func showLogin() {
    let loginController = createLoginAlert()
    present(loginController, animated: true, completion: nil)
  }
  private func createLoginAlert() -> UIAlertController {
    let loginController = UIAlertController(title: "Please Enter Your Username", message: "Usernames cannot contain spaces or special characters", preferredStyle: .alert)
    loginController.addTextField { (textfield) in
      textfield.placeholder = "Username"
      textfield.delegate = self
    }
    let submitAction = UIAlertAction(title: "Submit", style: .default) { (alertAction) in
      if let username = loginController.textFields?.first?.text {
        self.validateLogin(username: username)
        self.profileView.profileNameLabel.text = "@\(username)"
//        self.authenicateUser(username: username)
      }
    }
    loginController.addAction(submitAction)
    return loginController
  }
  
  private func authenicateUser(username:String) {
    if sessionManager.loginUser(username: username).success {
      dismiss(animated: true, completion: nil)
    }
    
    guard let data = profileView.profileImage.image?.pngData() else {
      fatalError("Placeholder doesn't exist")
    }
    let user = User.init(name: username, quizzes: [Quiz](), profileImage: data)
    sessionManager.saveUser(user: user)
    dismiss(animated: true, completion: nil)
}
  
  @discardableResult
  private func validateLogin(username:String) -> Bool{
    guard username.rangeOfCharacter(from: CharacterSet.alphanumerics) != nil else {
      dismiss(animated: true, completion: nil)
      return false
    }
    return true
  }
  
  private func setupCameraNavItem() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: #selector(takePhoto))
  }
  
  private func setupDelegtes(){
    imagePickerController.delegate = self
  }
  
  private func setupTapGesture(profileView: ProfileView) {
    let tapGestureRecognizer = UITapGestureRecognizer()
    tapGestureRecognizer.addTarget(self , action: #selector(showActionSheet))
    profileView.profileImage.addGestureRecognizer(tapGestureRecognizer)
  }
  
  private func createActionSheet() {
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (alertAction) in
      self.showPhotoLibrary()
    }
    [photoLibraryAction,cancelAction].forEach { actionSheetController.addAction($0) }
  }
  
  private func showPhotoLibrary() {
    imagePickerController.sourceType = .photoLibrary
    present(imagePickerController, animated: true, completion: nil)
  }
  
  @objc private func showActionSheet(){
    present(actionSheetController, animated: true, completion: nil)
  }
  
  @objc private func takePhoto() {
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      imagePickerController.sourceType = .camera
    }
    present(imagePickerController, animated: true, completion: nil)
  }
  
}

extension ProfileViewController: UIImagePickerControllerDelegate {
  @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      profileView.profileImage.image = image
      dismiss(animated: true, completion: nil)
    }
  }
}

extension ProfileViewController: UINavigationControllerDelegate {
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
}

extension ProfileViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let username = textField.text else { return false }
    return validateLogin(username: username)
  }
}
