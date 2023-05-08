//
//  AuthenticationService.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 07.05.23.
//

import Foundation

class AuthenticationService {
    let userDao: UserDao
    
    init(userDao: UserDao) {
        self.userDao = userDao
    }
    
    func authenticate(email: String, password: String) -> User? {
            
        if let data = UserDefaults.standard.data(forKey: "username") {
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: data)
                
                for user in users {
                    if user.email == email && user.password == password {
                        return user
                    }
                }
                
                return nil
                
            } catch {
                print("Unable to Decode Users (\(error))")
            }
        }
        
        return nil
    }
        // წავიკითხო იუზერის ობიექტი
        // გავფილტრო თუ არსებობს ეს ობიექტი
        //თუ არსებობს დავაბრუნებ User Tu arada nil
     
  
    
}

extension UserDao {
    func findByEmail(email: String) -> User? {
       
        return nil
    }
}
