//
//  RegistrationService.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 07.05.23.
//

import Foundation

class RegistrationService {
    let userDao: UserDao
    
    init(userDao: UserDao) {
        self.userDao = userDao
    }
    
    func registerUser(userName: String, email: String, password: String, confirmPassword: String) {
        let user = User(userName: userName, email: email, password: password, confirmPassword: confirmPassword)
        
        userDao.save(user: user)
    }
}

class UserDao {
    func save(user: User) {
        
        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: "username") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode User   (დატა ობიექტს გარდავქმნი იუზერების მასივის ობიექტად)
                var users = try decoder.decode([User].self, from: data)
                users.append(user)
                
                print("users: ", users)
                
                saveUser(users: users)
                
            } catch {
                print("Unable to Decode Users (\(error))")
            }
        } else {
            saveUser(users: [user])
        }
    }
    
    
    private func saveUser(users: [User]) {
        //Shenaxva
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(users)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "username")

        } catch {
            print("Unable to Encode Array of Users (\(error))")
        }
    }
}

    
    
    

