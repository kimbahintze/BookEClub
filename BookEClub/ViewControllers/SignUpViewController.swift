//
//  SignUpViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/1/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    var ref: DatabaseReference!

    // MARK: - Outlets
    @IBOutlet weak var joinLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var bySigningUpLabel: UILabel!
    @IBOutlet weak var userAgreeButton: UIButton!
    
    // Mark: - Actions
    @IBAction func joinButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func userAgreementButtonTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        usernameTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        emailTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
    }
    
    func signup(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty else { return }
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (dataresult, error) in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                self.duplicateUser()
                return
            }
            
        Auth.auth().createUser(withEmail: email, password: password) { (dataresult, error) in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                return
            }
            guard let uuid = Auth.auth().currentUser?.uid else { return }
            Database.database().reference().child("users").child(uuid).setValue(["username": username, "email": email, "postID": "false"])
            let sb = UIStoryboard(name: "Home", bundle: nil)
            let booksVC = sb.instantiateViewController(withIdentifier: "Books")
            self.present(booksVC, animated: true, completion: nil)
        }
    }
    }
        @objc func validateForm() {
        let isFormValid = emailTextField.text?.count ?? 0 > 0 &&
            passwordTextField.text?.count ?? 0 > 0 &&
            usernameTextField.text?.count ?? 0 > 0
        if isFormValid {
            joinButton.isEnabled = true
        } else {
            joinButton.isEnabled = false
        }
    }
    
    func duplicateUser() {
        let alertController = UIAlertController(title: "Email already in use", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            usernameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
            break
        case emailTextField:
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            break
        case passwordTextField:
            break
        default:
            break
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

