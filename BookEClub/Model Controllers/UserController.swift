//
//  UserController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 3/21/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import Foundation

class UserController {
    
    static var shared = UserController()
    
    var loggedInUser: User?
    
//    func fetchCurrentUser(completion: @escaping(Bool) -> Void) {
//        CKContainer.default().fetchUserRecordID { (appleUserRecordID, error) in
//            if let error = error {
//                print("Error fetching current user's apple record ID \(error)")
//                completion(false)
//                return
//            }
//            // unwrap the appleUserRecordID
//            guard let appleUserRecordID = appleUserRecordID else { completion(false) ; return }
//            
//            let predicate = NSPredicate(format: "appleUserRef == %@", appleUserRecordID)
//            
//            CloudKitManager.shared.fetch(type: User.userTypeKey, predicate: predicate, completion: { (records, error) in
//                if let error = error {
//                    print("Error fetching user by appleUserRef: \(error)")
//                    completion(false)
//                    return
//                }
//                guard let records = records,
//                let loggedInUserRecord = records.first
//                    else { completion(false) ; return }
//                
//                guard let loggedInUser = User(ckRecord: loggedInUserRecord) else { completion(false) ; return }
//                self.loggedInUser = loggedInUser
//                completion(true)
//            })
//        }
//    }
//    
//    func createNewUserWith(username: String, firstname: String, completion: @escaping(Bool) -> Void) {
//        CKContainer.default().fetchUserRecordID { (appleUserRecordID, error) in
//            if let error = error {
//                print("There was an error fetching the current user's apple record ID: \(error) \(#function)")
//                completion(false)
//                return
//            }
//            guard let appleUserRecordID = appleUserRecordID else { completion(false) ; return }
//            
//            // create new CKReference to unique Apple user record ID
//            let appleUserRef = CKRecord.Reference(recordID: appleUserRecordID, action: .deleteSelf)
//            
//            // create a new User model object
//            let newUser = User(username: username, firstName: firstname, appleUserRef: appleUserRef)
//            
//            // turn our new user into a ckRecord
//            let record = CKRecord(user: newUser)
//            
//            CloudKitManager.shared.publicDB.save(record, completionHandler: { (_, error) in
//                if let error = error {
//                    print("Error saving new user to the db: \(error)")
//                    completion(false)
//                    return
//                }
//                self.loggedInUser = newUser
//                completion(true)
//            })
//        }
//    }
}
