//
//  SearchResultsListViewModel.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 03.03.23.
//

import UIKit

final  class SearchResultsListViewModel {
    
    private var moviesService: MoviesService
    
    var onReceivedSearchMovies: (([SearchResultsViewModel]) -> Void)?
    
    
    
    
    init (
        moviesService: MoviesService
    ) {
        self.moviesService = moviesService
    }
    
    func fetchSearchMovies(query: String) {
        moviesService.fetchSearchMovies(with: query){ searchmovies in
            DispatchQueue.main.async {

                self.onReceivedSearchMovies?(searchmovies.result.map(SearchResultsViewModel.init))
            }
        }
    }
}
