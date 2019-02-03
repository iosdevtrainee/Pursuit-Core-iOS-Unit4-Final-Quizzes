//
//  ViewController+Extensions.swift
//  Quizzes
//
//  Created by J on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
extension UIViewController {
  public func showAlert(title: String, message: String?, actionMsg: String) {
    DispatchQueue.main.async {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: actionMsg, style: .default, handler: nil))
      self.present(alert, animated: true)
    }
  }
}
