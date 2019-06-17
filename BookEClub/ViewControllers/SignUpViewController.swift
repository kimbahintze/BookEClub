//
//  SignUpViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/1/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
   
    
    // MARK: - Outlets
    @IBOutlet weak var joinLabel: UILabel!
    @IBOutlet weak var teamNameTF: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var bySigningUpLabel: UILabel!
    @IBOutlet weak var userAgreeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamNameTF.delegate = self
        teamNameTF.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        emailTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        validateForm()
    }
    
    func signup() {
        guard let teamName = teamNameTF.text, !teamName.isEmpty else { return }
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
//        FirestoreReferenceManager.root
//            .collection("users")
//            .document("name")
//            .setData(["userName": "\(username)",
//                "email": "\(email)",
//                "password": "\(password)"]) { (err) in
//                if let err = err {
//                    print(err.localizedDescription)
//                } else {
//                    print("Successfully added new user")
//                }
//        }
//
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

                Database.database().reference().child("users").child(uuid).setValue(["username": teamName, "email": email, "postID": "false"])

                let sb = UIStoryboard(name: "Home", bundle: nil)
                let booksVC = sb.instantiateViewController(withIdentifier: "Books")
                self.present(booksVC, animated: true, completion: nil)
            }
        }
    }
    
    @objc func validateForm() {
        let isFormValid = emailTextField.text?.count ?? 0 > 0 &&
            passwordTextField.text?.count ?? 0 > 0 &&
            teamNameTF.text?.count ?? 0 > 0
        
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
    
    // Mark: - Actions
    @IBAction func joinButton(_ sender: Any) {
        signup()
    }
    
    // not sure if i need this
    @IBAction func userAgreementButtonTapped(_ sender: Any) {
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case teamNameTF:
            teamNameTF.resignFirstResponder()
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

