//
//  MoviesListViewModel.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 24.02.23.
//

import Foundation

final  class MoviesListViewModel {
    
    private var moviesService: MoviesService
    
    var onReceivedTrendingMovies: (([MoviesViewModel]) -> Void)?
    var onReceivedTrendingTV: (([MoviesViewModel]) -> Void)?
    var onReceivedPopular: (([MoviesViewModel]) -> Void)?
    var onReceivedupcomingMovies: (([MoviesViewModel]) -> Void)?


    
    init (
        moviesService: MoviesService
    ) {
        self.moviesService = moviesService
    }
    
    func fetchTrendingMovies() {
        moviesService.fetchTrendingMovies() { movies in
            DispatchQueue.main.async {
                
                self.onReceivedTrendingMovies?(movies.result.map(MoviesViewModel.init))
            }
        }
    }
    
    func fetchTrendingTV() {
        moviesService.fetchTrendingTV() { movies in
            DispatchQueue.main.async {
                
                self.onReceivedTrendingTV?(movies.result.map(MoviesViewModel.init))
            }
        }
    }
    
    func fetchPopular() {
        moviesService.fetchPopular() { movies in
            DispatchQueue.main.async {
                
                self.onReceivedPopular?(movies.result.map(MoviesViewModel.init))
            }
        }
    }
    
    func fetchUpcomingMovies() {
        moviesService.fetchUpcomingMovies() { movies in
            DispatchQueue.main.async {
                
                self.onReceivedupcomingMovies?(movies.result.map(MoviesViewModel.init))
            }
        }
    }
    
}
