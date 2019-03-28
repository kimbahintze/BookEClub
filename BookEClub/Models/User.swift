//
//  User.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/7/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import Foundation

class User {
    
    static let userTypeKey = "User"
    fileprivate static let usernameKey = "username"
    fileprivate static let firstNameKey = "firstName"
    fileprivate static let appleUserRefKey = "appleUserRef"
    
    
    var username: String
    var firstName: String

// Mark: - CloudKit
//    var cloudKitRecordID: CKRecord.ID?
//    let appleUserRef: CKRecord.Reference
//
//    init(username: String, firstName: String, appleUserRef: CKRecord.Reference ) {
//        self.username = username
//        self.firstName = firstName
//        self.appleUserRef = appleUserRef
//    }
//
//    // CKRecord is a glorified dictionary
//    init?(ckRecord: CKRecord) {
//        guard let username = ckRecord[User.usernameKey] as? String,
//        let firstName = ckRecord[User.usernameKey] as? String,
//            let appleUserRef = ckRecord[User.appleUserRefKey] as? CKRecord.Reference else { return nil }
//
//        self.username = username
//        self.firstName = firstName
//        self.appleUserRef = appleUserRef
//
//        self.cloudKitRecordID = ckRecord.recordID
//    }
}

// Turning a user into a CKRecord
// we did this as an extension because we wanted to initialize User
// we are also doing this because we want to modify
//extension CKRecord {
//    convenience init(user: User) {
//        
//        let recordID = user.cloudKitRecordID ?? CKRecord.ID(recordName: UUID().uuidString)
//        
//        self.init(recordType: User.userTypeKey, recordID: recordID)
//        self.setValue(user.username, forKey: User.usernameKey)
//        self.setValue(user.firstName, forKey: User.firstNameKey)
//        self.setValue(user.appleUserRef, forKey: User.appleUserRefKey)
//        
//        user.cloudKitRecordID = recordID
//    }
}

