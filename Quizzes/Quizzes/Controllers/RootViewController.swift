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
  private var quizVC: QuizzesViewController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupVCs()
    configureTabs()
  }
  
  private func setupVCs(){
  let sessionmManager = SessionManager()
  let quizManager = QuizManager(filename:"quiz.plist")
  createVC = CreateViewController(sessionManager: sessionmManager, quizManager: quizManager)
  searchVC = SearchViewController(sessionManager: sessionmManager, quizManager: quizManager)
  profileVC = ProfileViewController(sessionManager: sessionmManager)
  quizVC = QuizzesViewController(sessionManager: sessionmManager, quizManager: quizManager)
  }
  
  private func configureTabs() {
  let vcs = [quizVC, searchVC, createVC, profileVC]
    vcs.forEach { (vc) in
      switch vc {
      case vc as SearchViewController:
        vc?.tabBarItem.title = "Search"
        vc?.tabBarItem.image = UIImage(named: "Search")
      case vc as CreateViewController:
        vc?.tabBarItem.title = "Create"
        vc?.tabBarItem.image = UIImage(named: "AddQuiz")
        vc?.modalTransitionStyle = .coverVertical
      case vc as ProfileViewController:
        vc?.tabBarItem.title = "Profile"
        vc?.tabBarItem.image = #imageLiteral(resourceName: "profile-unfilled.png")
      case vc as QuizzesViewController:
        vc?.tabBarItem.title = "Quizzes"
        vc?.tabBarItem.image = UIImage(named: "Quiz")
      default:
        return
      }
    }
    self.setViewControllers(vcs.compactMap {UINavigationController(rootViewController: $0!)}, animated: true)
  }


}

