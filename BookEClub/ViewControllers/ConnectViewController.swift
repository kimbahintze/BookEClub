//
//  ConnectViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/5/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit
import CloudKit

class ConnectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let database = CKContainer.default().publicCloudDatabase
    
   // var posts = [Post]()
    
    var postRecords = [CKRecord]()
    
    // MARK: - Outlets
    @IBOutlet weak var seeProjectCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        seeProjectCollectionView.dataSource = self
        seeProjectCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postRecords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let projectCell = seeProjectCollectionView.dequeueReusableCell(withReuseIdentifier: "projectDetailViewCell", for: indexPath) as! ProjectDetailCollectionViewCell
        
        let post = postRecords[indexPath.row].value(forKey: <#T##String#>)
        
        projectCell.projectTitleLabel.text = post.projectTitle
        // project pic
       // projectCell.projectImageView. = post.projectPicURLAsString
        return projectCell
    }
    
    // need a reloadData() func
    
    // make sure to come back and finish the error handling
    func queryDatabase() {
        let query = CKQuery(recordType: "Posts", predicate: NSPredicate(value: true))
        database.perform(query, inZoneWith: nil) { (records, _) in
            guard let records = records else { return }
            self.postRecords = records
            DispatchQueue.main.async {
                self.seeProjectCollectionView.reloadData()
            }
        }
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "projectDetailViewCell" {
            guard let destinationVC = segue.destination as?
            ConnectDetailViewController,
            let cell = sender as? ProjectDetailCollectionViewCell,
                let indexPath = seeProjectCollectionView.indexPath(for: cell) else { return }
            let post = posts[indexPath.row]
            destinationVC.postImage = cell.projectImageView.image
            destinationVC.post = post
        }
    }
}
