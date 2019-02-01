//
//  ViewController.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 J. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {
  private var searchVC: SearchViewController!
  private var createVC: CreateViewController!
  private var profileVC: ProfileViewController!
  private var quizVC: QuizViewController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupVCs()
    configureTabs()
  }
  
  private func setupVCs(){
  searchVC = SearchViewController()
  createVC = CreateViewController()
  profileVC = ProfileViewController()
  quizVC = QuizViewController()
  }
  
  private func configureTabs() {
    let vcs = [searchVC, createVC, profileVC, quizVC]
    vcs.forEach { (vc) in
      switch vc {
      case vc as SearchViewController:
        vc?.tabBarItem.title = "Search"
//        vc?.tabBarItem.image = #imageLiteral(resourceName: "placeholder-image.png")
      case vc as CreateViewController:
        vc?.tabBarItem.title = "Create"
//        vc?.tabBarItem.image = #imageLiteral(resourceName: "placeholder-image.png")
      case vc as ProfileViewController:
        vc?.tabBarItem.title = "Profile"
        vc?.tabBarItem.image = #imageLiteral(resourceName: "profile-unfilled.png")
      case vc as QuizViewController:
        vc?.tabBarItem.title = "Quizzes"
//        vc?.tabBarItem.image = #imageLiteral(resourceName: "quiz-icon.png")
      default:
        return
      }
    }
    self.setViewControllers(vcs.compactMap {$0}, animated: true)
  }


}

