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
  public let filename: String = "users.plist"
  
  public func saveUser(user:User){
    UserDefaults.standard.set(user, forKey: user.name)
    currentUser = user
  }
  
  public var isLoggedIn: Bool {
    return currentUser != nil
  }
  
  public func loginUser(username:String) -> (success:Bool, user:User?){
    if let user = UserDefaults.standard.object(forKey: username) as? User {
      currentUser = user
      return (true, user)
    }
    return (false, nil)
  }
  
  public func saveUser(){
    let url = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
    if let user = self.currentUser, var users = fetchUsers() {
      do {
        users.append(user)
        let data = try PropertyListEncoder().encode(users)
        do {
          try data.write(to: url, options:.atomic)
        } catch {
          print("Should log this error")
        }
      } catch {
        print("Should log this error")
      }
    }
  }
  
  public func fetchUsers() -> [User]? {
    var users = [User]()
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path) {
        do {
          users = try PropertyListDecoder().decode([User].self, from: data)
        } catch {
          return nil
        }
      }
    }
    return users
  }
}
