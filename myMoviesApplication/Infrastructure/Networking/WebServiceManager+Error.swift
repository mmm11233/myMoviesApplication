//
//  WebServiceManager+Error.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 24.02.23.
//

import Foundation

extension WebServiceManager {
    enum WebServiceError: Error {
        case dataIsMissing
        case incorrectUrl
        case networkError(Error)
        case parsingError(Error)
    }
}
