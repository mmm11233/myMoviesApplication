//
//  UpComingViewController.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 22.02.23.
//

import UIKit

class UpComingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel: UpcomingListViewModel!
    private var dataSource: UpComingDataSource!
    private var moviesService: MoviesService!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Upcoming Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        configureViewModel()
        
    }
    

    private func configureViewModel() {
        moviesService = MoviesService(webServiceManager: WebServiceManager())
        viewModel = UpcomingListViewModel(moviesService: moviesService)
        dataSource = UpComingDataSource(tableView: tableView, viewModel: viewModel)
    }

}
