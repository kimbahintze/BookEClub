//
//  CloudKitManager.swift
//  BookEClub
//
//  Created by Kimba Hintze on 3/21/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitManager {
    
    // Mark: - Properties
    static var shared = CloudKitManager()
    
    let publicDB = CKContainer.default().publicCloudDatabase
    
    func fetch(type: String, predicate: NSPredicate, completion: @escaping([CKRecord]?, Error?) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: type, predicate: predicate)
        publicDB.perform(query, inZoneWith: nil, completionHandler: completion)
    }
}


