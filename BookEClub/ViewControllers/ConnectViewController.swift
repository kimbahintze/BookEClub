//
//  ConnectViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/5/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var posts = [Post]()
    
    // MARK: - Outlets
    @IBOutlet weak var seeProjectCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        seeProjectCollectionView.dataSource = self
        seeProjectCollectionView.delegate = self
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let projectCell = seeProjectCollectionView.dequeueReusableCell(withReuseIdentifier: "projectDetailViewCell", for: indexPath) as! ProjectDetailCollectionViewCell
        let post = posts[indexPath.row].projectTitle
        projectCell.projectTitleLabel.text = post
        // project pic
       // projectCell.projectImageView. = post.projectPicURLAsString
        return projectCell
    }
    
    // need a reloadData() func
    
//    // make sure to come back and finish the error handling
//    @objc func queryDatabase() {
//        let query = CKQuery(recordType: "Posts", predicate: NSPredicate(value: true))
//        database.perform(query, inZoneWith: nil) { (records, _) in
//            guard let records = records else { return }
//            let sortedRecords = records.sorted(by: { $0.creationDate! > $1.creationDate! })
//            self.postRecords = sortedRecords
//            DispatchQueue.main.async {
//                self.seeProjectCollectionView.refreshControl?.endRefreshing()
//                self.seeProjectCollectionView.reloadData()
//            }
//        }
//    }
    
    
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
