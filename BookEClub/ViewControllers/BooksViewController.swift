//
//  BooksViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/1/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit
import Firebase


class BooksViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        booksCollectionView.delegate = self
        booksCollectionView.dataSource = self
        
        UserController.shared.read(from: .books, returning: Book.self) { (books) in
            self.books = books
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = booksCollectionView.dequeueReusableCell(withReuseIdentifier: "bookDetailViewCell", for: indexPath) as! BookDetailCollectionViewCell
        let book = books[indexPath.row]
        cell.bookTitle.text = book.bookTitle
       let bookImage = UIImage(named: book.picture)
        cell.bookImage.image = bookImage
        cell.bookImage.contentMode = .scaleAspectFit
        cell.bookImage.clipsToBounds = true
        
        return cell
    }
    

    // MARK: - Navigation

   
    func buttonTappedInCollectionViewCell(sender: UICollectionViewCell) {
        self.performSegue(withIdentifier: "toBookDetailVC", sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toRecycleDetailVC" {
//            guard let destinationVC = segue.destination as? RecycleDetailViewController,
//                let indexPath = recycleInfoTableView.indexPathForSelectedRow else { return }
//            let materialToRecycle = materialsToRecycle[indexPath.row]
//            destinationVC.howToRecycle = materialToRecycle
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
