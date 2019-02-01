//
//  HomeScreenViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/1/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    @IBOutlet weak var homeScreenPageController: UIPageControl!
    
    @IBAction func switchPageAction(_ sender: Any) {
        if let pageCtrl = sender as? UIPageControl {
        print("You are on page \(pageCtrl.currentPage)")
    }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreenPageController.numberOfPages = 3
      
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
