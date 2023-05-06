//
//  SignUpViewController.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 01.05.23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var UserNameLbl: UITextField!
    @IBOutlet weak var EmailLbl: UITextField!
    @IBOutlet weak var PasswordLbl: UITextField!
    @IBOutlet weak var ConfirmPasswordLbl: UITextField!
    @IBOutlet weak var signUp: UIButton!
    
    var users: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        signUp.layer.cornerRadius = 10
    }
    

   
    @IBAction func onSignUp(_ sender: UIButton) {
        let user = User(userName: UserNameLbl.text ?? "", Email: EmailLbl.text ?? "", password: PasswordLbl.text ?? "", confirmPassword: ConfirmPasswordLbl.text ?? "")
    }
    
}
