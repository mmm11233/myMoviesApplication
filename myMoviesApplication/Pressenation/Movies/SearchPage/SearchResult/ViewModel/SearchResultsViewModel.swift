//
//  SearchResultsViewModel.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 03.03.23.
//

import UIKit

struct SearchResultsViewModel {
    let image: String?
  
    
    init(movie: Movie) {
        image = movie.posterPath
    }
}
