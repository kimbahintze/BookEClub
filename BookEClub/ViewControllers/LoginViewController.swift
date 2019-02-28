//
//  LoginViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 1/31/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit
import CloudKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func signUpButton(_ sender: Any) {
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        // figure out here to authorize it with icloud
        
        guard let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenTabBar") else { return }
        self.present(homeViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // need a saveLogin func
    

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
