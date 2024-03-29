//
//  MoviesViewModel.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 23.02.23.
//

import Foundation

struct MoviesViewModel {
    let image: String?
    let title: String?
    let description: String?
    
    init(movie: Movie) {
        image = movie.posterPath
        title = movie.originalTitle
        description = movie.overview
    }
}
