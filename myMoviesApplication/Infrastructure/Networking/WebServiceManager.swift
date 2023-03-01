//
//  WebServiceManager.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 24.02.23.
//

import Foundation

protocol WebServiceManaging: AnyObject {
    func get<T: Decodable>(url: String, completion: @escaping ((Result<T, WebServiceManager.WebServiceError>) -> Void))
}

typealias completionBlock<T: Decodable> = ((Result<T, WebServiceManager.WebServiceError>) -> Void)

class WebServiceManager: WebServiceManaging {
    
    func get<T: Decodable>(url: String, completion: @escaping completionBlock<T>) {
        guard let url = URL(string: url) else {
            completion(.failure(WebServiceError.incorrectUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
            }
            
            guard let data = data  else {
                completion(.failure(WebServiceError.dataIsMissing))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.parsingError(error)))
            }
        }
        .resume()
    }
}
