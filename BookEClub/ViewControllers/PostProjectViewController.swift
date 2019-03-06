//
//  PostProjectViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 3/1/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit
import CloudKit

class PostProjectViewController: UIViewController {
    
    let database = CKContainer.default().publicCloudDatabase

    // MARK: - Outlets
    @IBOutlet weak var projectPicImageView: UIImageView!
    @IBOutlet weak var projectTitleTextField: UITextField!
    @IBOutlet weak var projectDetailTextView: UITextView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    // MARK: - Actions
    @IBAction func cameraButtonTapped(_ sender: Any) {
    }
    
    @IBAction func sharedButtonTapped(_ sender: Any) {
        self.saveToCloud(projectImage: projectPicImageView, projectTitle: projectTitleTextField.text!, projectDetails: projectDetailTextView.text)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func saveToCloud(projectImage: UIImageView, projectTitle: String, projectDetails: String) {
        let newProject = CKRecord(recordType: "Project")
        newProject.setValue(projectTitle, forKey: "title")
        newProject.setValue(projectDetails, forKey: "details")
        newProject.setValue(projectImage, forKey: "image")
        
        database.save(newProject) { (record, _) in
           
            guard record != nil else { return }
            print("saved project")
        }
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
