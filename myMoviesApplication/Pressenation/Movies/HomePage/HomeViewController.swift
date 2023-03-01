//
//  HomeViewController.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 22.02.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var navBarImage: UIBarButtonItem!
    
    private var viewModel: MoviesListViewModel!
    private var dataSource: MoviesDataSource!
    private var moviesService: MoviesService!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .black
        configureViewModel()
        
       configureNavBar()
    
    }
    
    
    
    private func configureNavBar() {
      var image = UIImage(named: "netflix")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)

        var imagePlay = UIImage(named: "play")
        imagePlay = imagePlay?.withRenderingMode(.alwaysOriginal)
        var imageProfile = UIImage(named: "profile")
        imageProfile = imageProfile?.withRenderingMode(.alwaysOriginal)


        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: imagePlay, style: .done, target: self, action: nil),
            UIBarButtonItem(image: imageProfile, style: .done, target: self, action: nil)
        ]
        
//        navigationController?.navigationBar.tintColor = .white

//        let image = UIImage(systemName: "netflix")
//           let netflixBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: nil, action: nil)
//        netflixBarButtonItem.width = 5
//           navigationItem.rightBarButtonItem = netflixBarButtonItem

    }
    
    private func configureViewModel() {
        moviesService = MoviesService(webServiceManager: WebServiceManager())
        viewModel = MoviesListViewModel(moviesService: moviesService)
        dataSource = MoviesDataSource(tableView: tableView, viewModel: viewModel)
        
    }
    
    
   
}
