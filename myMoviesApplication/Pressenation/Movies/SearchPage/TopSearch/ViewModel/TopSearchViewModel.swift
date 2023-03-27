//
//  SearchViewModel.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 03.03.23.
//

import Foundation

struct TopSearcheViewModel {
    let image: String?
    let title: String?
  
    
    init(movie: Movie) {
        image = movie.posterPath
        title = movie.originalTitle
    }
}
