//
//  MoviesDatasource.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 23.02.23.
//

import UIKit

class MoviesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
   
    
    private let tableView: UITableView
    private let scrollView:UIScrollView
    
    private let viewModel: MoviesListViewModel
    
    private var trendingMovies = [MoviesViewModel]()
    private var trendingTV = [MoviesViewModel]()
    private var populars = [MoviesViewModel]()
    private var upcomings = [MoviesViewModel]()
    private var toprated = [MoviesViewModel]()
    
    
    
    private var navigation: UINavigationController
    
    var animationStart: ((MoviesViewModel) -> Void)?
    
    init(
        tableView: UITableView,
        viewModel: MoviesListViewModel,
        navigation: UINavigationController,
        scrollView: UIScrollView
    ) {
        
        self.tableView = tableView
        self.viewModel = viewModel
        self.navigation = navigation
        self.scrollView = scrollView
        super.init()
        
        self.scrollView.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        navigation.navigationBar.barTintColor = .black
        
        self.tableView.register(UINib(nibName: "HomePageTraillerCell", bundle: nil), forCellReuseIdentifier: "HomePageTraillerCell")
        self.tableView.register(UINib(nibName: "HomePageTableViewCell", bundle: nil), forCellReuseIdentifier: "HomePageTrendingCell")
        
        
        viewModel.fetchTrendingMovies()
        viewModel.onReceivedTrendingMovies = { trendingmovie in
            self.trendingMovies = trendingmovie
            self.tableView.reloadData()
        }
        
        viewModel.fetchTrendingTV()
        viewModel.onReceivedTrendingTV = { trendingTV in
            self.trendingTV = trendingTV
            self.tableView.reloadData()
            
        }
        
        viewModel.fetchPopular()
        viewModel.onReceivedPopular = { popularmovie in
            self.populars = popularmovie
            self.tableView.reloadData()
        }
        
        viewModel.fetchUpcomingMovies()
        viewModel.onReceivedupcomingMovies = { upcomingmovie in
            self.upcomings = upcomingmovie
            self.tableView.reloadData()
        }
        
        viewModel.fetchTopRated()
        viewModel.onReceivedTopRated = { toprated in
            self.toprated = toprated
            self.tableView.reloadData()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTraillerCell", for: indexPath) as! HomePageTraillerCell
            if !trendingMovies.isEmpty {
                cell.configure(with: trendingMovies[indexPath.row])
            }
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTrendingCell", for: indexPath) as! HomePageTrendingCell
            
            cell.delegate = self
            switch indexPath.section {
            case 1:
                cell.configure(trendingMovies)
            case 2:
                cell.configure(trendingTV)
            case 3:
                cell.configure(populars)
            case 4:
                cell.configure(upcomings)
            case 5:
                cell.configure(toprated)
                
            default:
                break
            }
            
            return cell
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 400
        } else {
            return 200
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return ""
        case 1:
            return "Trending movies"
        case 2:
            return "Trending TV"
        case 3:
            return "Populars"
        case 4:
            return "Upcoming movies"
        case 5:
            return "Toprated"
        default:
            return ""
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .white
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let percentageScrolled = yOffset / (contentHeight - scrollView.frame.height)
        
        let newColor = UIColor(red: percentageScrolled, green: percentageScrolled, blue: percentageScrolled, alpha: 1.0)
        navigation.navigationBar.barTintColor = newColor
    }
    
}


extension MoviesDataSource: MoviesDetailsDelegate {
    func didSelect(movie: MoviesViewModel) {
        let storyboard = UIStoryboard(name: "DetailsViewController", bundle: nil)
        let vC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vC.detailsMovies = movie
        navigation.pushViewController(vC, animated: true)
    }
}



