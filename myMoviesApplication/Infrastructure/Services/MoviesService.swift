//
//  MoviesService.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 24.02.23.
//

import Foundation


class MoviesService {
    private let webServiceManager: WebServiceManaging
    
    init(webServiceManager: WebServiceManaging) {
        self.webServiceManager = webServiceManager
    }
    
    func fetchTrendingMovies(completion: @escaping ((MoviesResponse) -> Void)) {
        webServiceManager.get(url: "https://api.themoviedb.org/3/trending/movie/week?api_key=5640b394ad4d380d373cddff07791a1c") { (result: Result<MoviesResponse, WebServiceManager.WebServiceError>) in
            switch result {
            case let .success(movies):
                completion(movies)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func fetchTrendingTV(completion: @escaping ((MoviesResponse) -> Void)) {
        webServiceManager.get(url: "https://api.themoviedb.org/3/trending/tv/week?api_key=5640b394ad4d380d373cddff07791a1c") { (result: Result<MoviesResponse, WebServiceManager.WebServiceError>) in
            switch result {
            case let .success(TV):
                completion(TV)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func fetchPopular(completion: @escaping ((MoviesResponse) -> Void)) {
        webServiceManager.get(url: "https://api.themoviedb.org/3/trending/all/day?api_key=5640b394ad4d380d373cddff07791a1c") { (result: Result<MoviesResponse, WebServiceManager.WebServiceError>) in
            switch result {
            case let .success(movies):
                completion(movies)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func fetchUpcomingMovies(completion: @escaping ((MoviesResponse) -> Void)) {
        webServiceManager.get(url: "https://api.themoviedb.org/3/movie/upcoming?api_key=5640b394ad4d380d373cddff07791a1c") { (result: Result<MoviesResponse, WebServiceManager.WebServiceError>) in
            switch result {
            case let .success(movies):
                completion(movies)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    
    func fetchTopRated(completion: @escaping ((MoviesResponse) -> Void)) {
        webServiceManager.get(url: "https://api.themoviedb.org/3/movie/top_rated?api_key=5640b394ad4d380d373cddff07791a1c") { (result: Result<MoviesResponse, WebServiceManager.WebServiceError>) in
            switch result {
            case let .success(movies):
                completion(movies)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func fetchDiscoverMovies(completion: @escaping ((MoviesResponse) -> Void)) {
        webServiceManager.get(url: "https://api.themoviedb.org/3/discover/movie?api_key=5640b394ad4d380d373cddff07791a1c") { (result: Result<MoviesResponse, WebServiceManager.WebServiceError>) in
            switch result {
            case let .success(movies):
                completion(movies)
            case let .failure(error):
                print(error)
            }
        }
        
    }
    
    func fetchSearchMovies(with query: String, completion: @escaping ((MoviesResponse) -> Void)) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        webServiceManager.get(url: "https://api.themoviedb.org/3/search/movie?api_key=5640b394ad4d380d373cddff07791a1c&query=\(query)") { (result: Result<MoviesResponse, WebServiceManager.WebServiceError>) in
            switch result {
            case let .success(movies):
                completion(movies)
            case let .failure(error):
                print(error)
            }
        }
        
    }

}
    
        
    

