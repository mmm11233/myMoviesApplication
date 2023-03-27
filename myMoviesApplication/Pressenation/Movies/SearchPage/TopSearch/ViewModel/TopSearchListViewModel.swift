//
//  SearchListViewModel.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 03.03.23.
//

import Foundation

final  class TopSearchListViewModel {
    
    private var moviesService: MoviesService
    
    var onReceivedTopSearchMovies: (([TopSearcheViewModel]) -> Void)?
    
    
    
    
    init (
        moviesService: MoviesService
    ) {
        self.moviesService = moviesService
    }
    
    func fetchDiscoverMovies() {
        moviesService.fetchDiscoverMovies(){ topsearchmovies in
            DispatchQueue.main.async {
                
                self.onReceivedTopSearchMovies?(topsearchmovies.result.map(TopSearcheViewModel.init))
            }
        }
    }
}
