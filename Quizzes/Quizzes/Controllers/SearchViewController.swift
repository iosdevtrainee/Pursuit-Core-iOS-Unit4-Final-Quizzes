//
//  SearchViewController.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  private var sessionManager: SessionManager!
  private var quizManager: QuizManager!
  private var quizAPIClient = QuizAPIClient()
  private var searchView = SearchView()
  private var quizzes = [SearchQuiz]()
  convenience init(sessionManager:SessionManager, quizManager: QuizManager){
    self.init()
    self.sessionManager = sessionManager
    self.quizManager = quizManager
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    quizAPIClient.fetchQuizzes()
    quizAPIClient.delegate = self
    searchView.searchBar.delegate = self
    searchView.quizCollection.delegate = self
    searchView.quizCollection.dataSource = self
    navigationItem.title = "Search Quizzes Online"
    view = searchView
  }
  
  
  
}

extension SearchViewController: QuizAPIClientDelegate {
  func quizAPIClient(_ quizAPIClient: QuizAPIClient, didReceiveData quizzes: [SearchQuiz]) {
    self.quizzes = quizzes
    DispatchQueue.main.async {
        self.searchView.quizCollection.reloadData()
    }
  }
  
  func quizAPIClient(_ quizAPIClient: QuizAPIClient, didReceiveError error: AppError) {
    
  }
}

extension SearchViewController: UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = searchView.quizCollection.dequeueReusableCell(withReuseIdentifier: "SearchQuizCell", for: indexPath) as? SearchQuizCell else { fatalError("") }
    let quiz = quizzes[indexPath.row]
    cell.configureCell(quiz:quiz, imageName: "add-icon")
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return quizzes.count
  }
}
extension SearchViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height
      / 3)
  }
}

extension SearchViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    guard let searchText = searchBar.text else { return }
    if searchText.isEmpty { quizAPIClient.fetchQuizzes(); return }
    quizzes = quizzes.filter { $0.quizTitle.contains(searchText)}
    searchView.quizCollection.reloadData()
  }
}
