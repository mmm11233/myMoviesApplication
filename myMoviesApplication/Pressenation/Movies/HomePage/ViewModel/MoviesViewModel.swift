//
//  MoviesViewModel.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 23.02.23.
//

import Foundation

struct MoviesViewModel {
    let image: String?
    
    init(movie: Movie) {
        image = movie.posterPath
    }
}
