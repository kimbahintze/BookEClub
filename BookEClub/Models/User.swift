//
//  User.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/7/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import Foundation
import CloudKit

class User {
    
    static let emailKey = "email"
    static let passwordKey = "password"
    static let appleUserRefKey = "appleUserRef"
    static let recordTypeKey = "User"
    
    var email: String
    var password: String
    
    // This is the reference to the default Apple 'Users' record ID
    let appleUserRef: CKRecord.Reference
    
    // I MAY need this when creating the kid's profile
    // This is your CUSTOM user record's record ID
    //var cloudKitRecordID: CKRecordID?
    
    init(email: String, password: String, appleUserRef: CKRecord.Reference) {
        self.email = email
        self.password = password
        self.appleUserRef = appleUserRef
    }
    
    /* JUST IN CASE
 init?(cloudKitRecord: CKRecord) {
 guard let username = cloudKitRecord[User.usernameKey] as? String,
 let email = cloudKitRecord[User.emailKey] as? String,
 let appleUserRef = cloudKitRecord[User.appleUserRefKey] as? CKReference else { return nil }
 
 self.username = username
 self.email = email
 self.appleUserRef = appleUserRef
 self.cloudKitRecordID = cloudKitRecord.recordID
 
 }
 */
}

/*
 extension CKRecord {
 
 convenience init(user: User) {
 
 let recordID = user.cloudKitRecordID ?? CKRecordID(recordName: UUID().uuidString)
 
 self.init(recordType: User.recordTypeKey, recordID: recordID)
 
 self.setValue(user.username, forKey: User.usernameKey)
 self.setValue(user.email, forKey: User.emailKey)
 self.setValue(user.appleUserRef, forKey: User.appleUserRefKey)
 }
 }
 */
