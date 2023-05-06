//
//  User.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 02.05.23.
//

import Foundation
struct User: Codable {
    let userName: String
    let Email: String
    let password: String
    let confirmPassword: String
}
