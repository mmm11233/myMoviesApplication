//
//  UpcomingViewModel.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 01.03.23.
//

import Foundation

struct UpcomingViewModel {
    let image: String?
    let title: String?
    
    init(movie: Movie) {
        image = movie.posterPath
        title = movie.originalTitle
    }
}
