//
//  SearchViewController.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 22.02.23.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel: TopSearchListViewModel!
    private var dataSource: TopSearchDataSource!
    private var moviesService: MoviesService!
    
    private let searchController: UISearchController = {
        let storyboard = UIStoryboard(name: "SearchResultsViewController", bundle: nil)
        let vC = storyboard.instantiateViewController(withIdentifier: "SearchResultsViewController") as! SearchResultsViewController
        
        let controller = UISearchController(searchResultsController: vC)
        controller.searchBar.placeholder = "Search for a Movie or a Tv show"
        controller.searchBar.searchTextField.textColor = UIColor.white

        
//        if let searchTextField = controller.searchBar.value(forKey: "searchField") as? UITextField {
//                    searchTextField.textColor = UIColor.white
//                }
        controller.searchBar.searchBarStyle = .minimal
        controller.searchBar.tintColor = .red
//        controller.searchBar.searchTextField.tintColor = .white
        
        //MARK es kodi ar mushaobs
//        controller.searchBar.searchTextField.textColor = UIColor(white: 0.5, alpha: 1)
        

        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Top Searches"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
        navigationController?.navigationBar.backgroundColor = .black
        configureViewModel()
        
        searchController.searchResultsUpdater = self
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.searchTextField.textColor = UIColor.white // set the text color to red
    }


    private func configureViewModel() {
        moviesService = MoviesService(webServiceManager: WebServiceManager())
        viewModel = TopSearchListViewModel(moviesService: moviesService)
        dataSource = TopSearchDataSource(tableView: tableView, viewModel: viewModel)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        guard let query = searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3,
              let resultsController = searchController.searchResultsController as? SearchResultsViewController else {
            return
        }
        
        resultsController.fetchSearchMovies(query: query)
    }
}
