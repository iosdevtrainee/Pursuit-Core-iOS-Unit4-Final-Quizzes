//
//  SessionManager.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
final class SessionManager {
  public var currentUser: User?
  public func saveUser(user:User){
    UserDefaults.standard.set(user, forKey: user.name)
    currentUser = user
  }
  
  public func loginUser(username:String) -> (success:Bool, user:User?){
    if let user = UserDefaults.standard.object(forKey: username) as? User {
      currentUser = user
      return (true, user)
    }
    return (false, nil)
  }
  
}
