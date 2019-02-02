//
//  SearchView.swift
//  Quizzes
//
//  Created by J on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {
  public lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    return searchBar
  }()
  
  public lazy var quizCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let quizCollection = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
    quizCollection.register(SearchQuizCell.self, forCellWithReuseIdentifier: "SearchQuizCell")
    quizCollection.backgroundColor = .white
    return quizCollection
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func layoutSubviews() {
    setupViews()
  }
  
  private func setupViews(){
    setupSearchBar()
    setupQuizCollection()
  }
  
  private func setupSearchBar(){
    addSubview(searchBar)
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    searchBar.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
    searchBar.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
    searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
  }
  
  private func setupQuizCollection(){
    addSubview(quizCollection)
    quizCollection.translatesAutoresizingMaskIntoConstraints = false
    quizCollection.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
    quizCollection.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
    quizCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
}
