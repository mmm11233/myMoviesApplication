//
//  SearchDataSource.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 02.03.23.
//

import UIKit

class TopSearchDataSource: NSObject, UITableViewDataSource, UITableViewDelegate  {
    
    private let tableView: UITableView
    private let viewModel: TopSearchListViewModel
    private var TopSearchMovies = [TopSearcheViewModel]()

    
    init(
        tableView: UITableView,
        viewModel: TopSearchListViewModel
    ) {
        
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.register(UINib(nibName: "TopSearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        
        viewModel.fetchDiscoverMovies()
        viewModel.onReceivedTopSearchMovies = { topsearchmovie in
            self.TopSearchMovies = topsearchmovie
            self.tableView.reloadData()
        }

      
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TopSearchMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        cell.backgroundColor = .black
        cell.configure(with: TopSearchMovies[indexPath.row])
        
        return cell
            
        }
        
    }
    
    
    
    

