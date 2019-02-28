//
//  UserAgreementViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/12/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit

class UserAgreementViewController: UIViewController {

    @IBOutlet weak var userAgreementTextView: UITextView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userAgreementTextView.isEditable = false
        userAgreementTextView.layer.cornerRadius = 15
        userAgreementTextView.layer.borderWidth = 1
    }
}
