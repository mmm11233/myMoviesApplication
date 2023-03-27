//
//  SearchResultsDatasource.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 03.03.23.
//

import UIKit

class SearchResultsDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var searchResult: [SearchResultsViewModel] = []
    private let viewModel: SearchResultsListViewModel
    private let itemsPerRow: CGFloat = 3
    var sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    
    private let collectionView: UICollectionView
    
    init(
        collectionView: UICollectionView,
        viewModel: SearchResultsListViewModel
    ) {
        
        self.collectionView = collectionView
        self.viewModel = viewModel
        super.init()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "SearchResultsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchResultsCollectionViewCell")
        
        
        viewModel.onReceivedSearchMovies = { searchmovie in
            self.searchResult = searchmovie
            self.collectionView.reloadData()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultsCollectionViewCell", for: indexPath) as! SearchResultsCollectionViewCell
        cell.configure(with: searchResult[indexPath.row])
        return cell
    }
    
  
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return sectionInsets.left
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return sectionInsets
    }
}

