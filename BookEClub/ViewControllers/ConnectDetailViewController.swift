//
//  ConnectDetailViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/5/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit

class ConnectDetailViewController: UIViewController {
    
    var post: Post?
    var postImage: UIImage?
    
    // Mark: - Outlets
    
    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var projectTitleLabel: UILabel!
    @IBOutlet weak var projectDetailTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
