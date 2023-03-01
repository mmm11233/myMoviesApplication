//
//  MoviesDatasource.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 23.02.23.
//

import UIKit

class MoviesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    private let tableView: UITableView
    private let viewModel: MoviesListViewModel
    
    private var trendingMovie = [MoviesViewModel]()
    private var trendingTV = [MoviesViewModel]()
    private var popular = [MoviesViewModel]()
    private var upcoming = [MoviesViewModel]()
    private var trailer = [MoviesViewModel]()
    
    
    
    
    
    
    init(
        tableView: UITableView,
        viewModel: MoviesListViewModel
    ) {
        
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UINib(nibName: "HomePageTraillerCell", bundle: nil), forCellReuseIdentifier: "HomePageTraillerCell")
        self.tableView.register(UINib(nibName: "HomePageTrendingCell", bundle: nil), forCellReuseIdentifier: "HomePageTrendingCell")
        
        viewModel.fetchTrendingMovies()
        viewModel.onReceivedTrendingMovies = { trendingmovie in
            self.trendingMovie = trendingmovie
            self.tableView.reloadData()
        }
        
        viewModel.fetchTrendingTV()
        viewModel.onReceivedTrendingTV = { trendingTV in
            self.trendingMovie = trendingTV
            self.tableView.reloadData()
            
        }
        
        viewModel.fetchPopular()
        viewModel.onReceivedPopular = { popularmovie in
            self.trendingMovie = popularmovie
            self.tableView.reloadData()
        }
        
        viewModel.fetchUpcomingMovies()
        viewModel.onReceivedupcomingMovies = { upcomingmovie in
            self.trendingMovie = upcomingmovie
            self.tableView.reloadData()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTraillerCell", for: indexPath) as! HomePageTraillerCell
            cell.configure(trailer)
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTrendingCell", for: indexPath) as! HomePageTrendingCell
            
                              switch indexPath.row {
                                    case 0:
                                        cell.configure(trendingMovie)
                                    case 0:
                                        cell.configure(trendingTV)
                                    case 1:
                                        cell.configure(popular)
                                    case 2:
                                        cell.configure(upcoming)

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
                return "Trending movies"
            case 1:
                return "Trending TV"
            case 2:
                return "Popular"
            case 3:
                return "Upcoming movies"
            default:
                return ""
                
            }
        }
        
        
        
        //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        let defaultOffset = view.safeAreaInsets.top
        //        let offset = scrollView.contentOffset.y + defaultOffset
        //
        //        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
        //    }
        
        
    }
