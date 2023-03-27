//
//  SearchResultsViewController.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 03.03.23.
//

import UIKit

class SearchResultsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    private var viewModel: SearchResultsListViewModel!
    private var dataSource: SearchResultsDataSource!
    private var moviesService: MoviesService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        configureViewModel()
    }
    

    private func configureViewModel() {
       moviesService = MoviesService(webServiceManager: WebServiceManager())
       viewModel = SearchResultsListViewModel(moviesService: moviesService)
       dataSource = SearchResultsDataSource(collectionView: collectionView, viewModel: viewModel)
    }
    
    
    func fetchSearchMovies(query: String) {
        viewModel.fetchSearchMovies(query: query)
    }
}
