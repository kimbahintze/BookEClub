//
//  BookDetailViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/5/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit
import FirebaseDatabase

class BookDetailViewController: UIViewController {
    
    var books = [Books]()
    var chapters = [Chapters]()
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var chapterTableView: UITableView!
    
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
