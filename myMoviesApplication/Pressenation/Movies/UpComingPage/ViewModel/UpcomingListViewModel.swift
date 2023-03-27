//
//  UpcomingListViewModel.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 01.03.23.
//

import Foundation

final  class UpcomingListViewModel {
    
    private var moviesService: MoviesService
    var onReceivedUpcomingMovies: (([UpcomingViewModel]) -> Void)?
    
    
    
    init (
        moviesService: MoviesService
    ) {
        self.moviesService = moviesService
    }
    
    func fetchUpcomingMovies() {
        moviesService.fetchUpcomingMovies() { upcomingmovies in
            DispatchQueue.main.async {
                
                self.onReceivedUpcomingMovies?(upcomingmovies.result.map(UpcomingViewModel.init))
            }
        }
        
    }
}
    
    

