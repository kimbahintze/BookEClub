//
//  BooksViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/1/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        booksCollectionView.delegate = self
        booksCollectionView.dataSource = self
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BooksMC.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = booksCollectionView.dequeueReusableCell(withReuseIdentifier: "bookDetailViewCell", for: indexPath) as! BookDetailCollectionViewCell
        let book = BooksMC.books[indexPath.row]
        cell.bookTitle.text = book.name
       let bookImage = UIImage(named: book.picture)
        cell.bookImage.image = bookImage
        cell.bookImage.contentMode = .scaleAspectFit
        cell.bookImage.clipsToBounds = true
        
        return cell
    }
    

    // MARK: - Navigation

   
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toBookDetailVC" {
//            guard let destinationVC = segue.destination as? BookDetailViewController, let cell = sender as? BookDetailCollectionViewCell, let indexPath = booksCollectionView.indexPath(for: cell) else { return }
//            let post = posts[indexPath.row]
//            destinationVC.bookImageView = cell.bookImage
//            destinationVC.bookTitle.text = cell.bookTitle
//
//        }
//    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProjectDetailVC" {
            guard let destinationVC = segue.destination as? ProjectDetailViewController,
                let cell = sender as? ProjectBasicInfoCollectionViewCell,
                let indexPath = viewProjectsCollectionView.indexPath(for: cell) else { return }
            let post = posts[indexPath.row]
            destinationVC.postImage = cell.projectImage.image
            destinationVC.post = post
 */

}
