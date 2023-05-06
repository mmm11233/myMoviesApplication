//
//  SignInViewController.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 01.05.23.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var EmailLbl: UITextField!
    @IBOutlet weak var PasswordLbl: UITextField!
    @IBOutlet weak var ForgotPasswordLbl: UILabel!
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUp.layer.cornerRadius = 10
        signIn.layer.cornerRadius = 10

    }
    
    func checkCredentials(username: String?, password: String?) -> Bool {
        // check if username and password are not nil and match the registered credentials
        if let username = username, let password = password, username == "registeredUsername", password == "registeredPassword" {
            return true
        }
        return false
    }

    
    @IBAction func onSignIn(_ sender: UIButton) {
        if checkCredentials(username: usernameTextField.text, password: passwordTextField.text) {
            
            let sb = UIStoryboard(name: "MainTabBarViewController", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainTabBarViewController")
            navigationController?.pushViewController(vc, animated: false)
            
        }else {
            // credentials are invalid, show error message
            let alert = UIAlertController(title: "Invalid Credentials", message: "Please enter valid credentials.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func onSignUp(_ sender: UIButton) {
        let sb = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SignUpViewController")
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
