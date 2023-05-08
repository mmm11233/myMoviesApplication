//
//  User.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 02.05.23.
//

import Foundation
struct User: Codable {
    let userName: String
    let email: String
    let password: String
    let confirmPassword: String
    
    func toDictionary() -> [String: Any] {
            return [
                "userName": self.userName,
                "email": self.email,
                "password": self.password,
                "confirmPassword": self.confirmPassword
            ]
        }
}
