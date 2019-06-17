//
//  SnapshotExtensions.swift
//  BookEClub
//
//  Created by Kimba Hintze on 6/15/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import FirebaseFirestore

extension DocumentSnapshot {
    
    func decode<T: Decodable>(as objectType: T.Type, includingId: Bool = true) throws -> T {
        
        var documentJson = data()
        if includingId {
            documentJson?["id"] = documentID
        }
        let documentData = try JSONSerialization.data(withJSONObject: documentJson, options: [])
        let decodedObject = try JSONDecoder().decode(objectType, from: documentData)
        return decodedObject
    }
    
}


