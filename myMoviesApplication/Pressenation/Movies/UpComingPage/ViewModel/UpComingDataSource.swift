//
//  UpComingDataSource.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 24.02.23.
//

import UIKit

class UpComingDataSource: NSObject,UITableViewDataSource, UITableViewDelegate  {
    
    private let tableView: UITableView
    private var Upcoming = [UpcomingViewModel]()
    private let viewModel: UpcomingListViewModel
    
    
    init(
        tableView: UITableView,
        viewModel: UpcomingListViewModel
    ) {
        
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UINib(nibName: "UpComingCell", bundle: nil), forCellReuseIdentifier: "UpComingCell")
        
        
        viewModel.fetchUpcomingMovies()
        viewModel.onReceivedUpcomingMovies = { upcomingmovies in
            self.Upcoming = upcomingmovies
            self.tableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Upcoming.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpComingCell", for: indexPath) as! UpComingCell
        cell.backgroundColor = .black
        cell.configure(with: Upcoming[indexPath.row])
        
        return cell
        
    }
    
    
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
//        headerView.backgroundColor = UIColor.black
//        
//        let label = UILabel(frame: headerView.bounds)
//        label.text = "Upcoming Movies"
//        label.textColor = .white
//        label.textAlignment = .center
//        headerView.addSubview(label)
//        
//        return headerView
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 50
//        }
    
}

    

