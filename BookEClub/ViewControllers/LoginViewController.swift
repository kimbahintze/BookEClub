//
//  LoginViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 1/31/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    // MARK: - Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        usernameTextField.text = nil
        emailTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        resetPassword(email: email)
    }
    
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil {
                let alert = UIAlertController(title: "An email has been sent to \(email) to reset password.", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print("An email has been sent to \(email) to reset the password")
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty else { return }
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
            self.resetPasswordPop()
            }
            guard let booksVC = self.storyboard?.instantiateViewController(withIdentifier: "Books") else { return }
            self.present(booksVC, animated: false, completion: nil)
        }
    }
    
    func resetPasswordPop() {
        let alert = UIAlertController(title: "Error logging in.", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
    }
    
    // double check with mocc to see if i need to call this anywhere
    @objc func validateEmail() {
        let isFormValid = emailTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0
        
        if isFormValid {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
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

