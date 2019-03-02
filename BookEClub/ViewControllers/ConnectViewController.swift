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

    var posts = [Post]()
    
    // MARK: - Outlets
    @IBOutlet weak var seeProjectCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let container = CKContainer.default()
//        let publicDatabase = container.publicCloudDatabase
//        let privateDatabase = container.privateCloudDatabase
//        let sharedDatabase = container.sharedCloudDatabase
//        
        seeProjectCollectionView.dataSource = self
        seeProjectCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let projectCell = seeProjectCollectionView.dequeueReusableCell(withReuseIdentifier: "projectDetailViewCell", for: indexPath) as! ProjectDetailCollectionViewCell
        
        let post = posts[indexPath.row]
        
        projectCell.projectTitleLabel.text = post.projectTitle
        // project pic
       // projectCell.projectImageView. = post.projectPicURLAsString
        return projectCell
    }
    
    // need a reloadData() func
    
    // need a loadData() func
    
    
    
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
