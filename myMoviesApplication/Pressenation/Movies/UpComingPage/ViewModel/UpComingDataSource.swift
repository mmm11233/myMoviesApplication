//
//  UpComingDataSource.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 24.02.23.
//

import UIKit

class UpComingDataSource: NSObject,UITableViewDataSource, UITableViewDelegate  {
    
    private let tableView: UITableView
    
    init(
        tableView: UITableView
//        viewModel: MoviesListViewModel
    ) {
        
        self.tableView = tableView
//        self.viewModel = viewModel
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.register(UINib(nibName: "UpComingCell", bundle: nil), forCellReuseIdentifier: "UpComingCell")
        
        
//        viewModel.fetchNews()
//        viewModel.onReceivedMovies = { movies in
//            self.movies = movies
//            self.tableView.reloadData()
//        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpComingCell", for: indexPath) as! UpComingCell
        cell.backgroundColor = .black
        cell.configure()
        
        return cell
            
        }
        
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Trending movies"
        default:
            return ""
            
        }
    }
    
    

