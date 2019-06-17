//
//  PostProjectViewController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 3/1/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import UIKit

class PostProjectViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var projectPicImageView: UIImageView!
    @IBOutlet weak var projectTitleTextField: UITextField!
    @IBOutlet weak var projectDetailTextView: UITextView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let picker = UIImagePickerController()
    
    // MARK: - Actions
    @IBAction func cameraButtonTapped(_ sender: Any) {
    }
    
    @IBAction func sharedButtonTapped(_ sender: Any) {
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Choose an image from the library
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker {
            projectPicImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleProjectImage() {
        picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
    // Create
    func newPost() {
        guard let title = projectTitleTextField.text, !title.isEmpty,
            let details = projectDetailTextView.text, !details.isEmpty,
            let pic = projectPicImageView.image else { return }
        
        if let imageData = pic.pngData() {
            
        }
    }
    
    // Read
    
    // Update
    
    // Delete
    
//    func saveToCloud(projectImage: UIImageView, projectTitle: String, projectDetails: String) {
//        let newProject = CKRecord(recordType: "Project")
//        newProject.setValue(projectTitle, forKey: "title")
//        newProject.setValue(projectDetails, forKey: "details")
//        newProject.setValue(projectImage, forKey: "image")
//        
//        database.save(newProject) { (record, _) in
//            // make sure to come back and finish the error handling
//            guard record != nil else { return }
//            print("saved project")
//        }
//    }
    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination
        // Pass the selected object to the new view controller.
    }
    */

}
