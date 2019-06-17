//
//  UserController.swift
//  BookEClub
//
//  Created by Kimba Hintze on 3/21/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import Firebase

class UserController {
    
    // look up why I do this
    private init() {}
    
    static let shared = UserController()
    
    private func reference(to collectionReference: FIRCollectionReference) -> CollectionReference {
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    // CRUD OPERATIONS
    func create<T: Encodable>(for encodableObject: T, in collectionRefence: FIRCollectionReference) throws {
        do {
            let json = try encodableObject.toJson(excluding: ["id"])
            reference(to: .users).addDocument(data: json)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func read<T: Decodable>(from collectionReference: FIRCollectionReference, returning objectType: T.Type, completion: @escaping ([T]) -> Void) {
        
        reference(to: .books).addSnapshotListener { (snapshot, err) in
            if let err = err {
                print("Error reading data \(err.localizedDescription)")
            } else {
                print("Data successfully read.")
            }
            guard let snapshot = snapshot else { return }
            do {
                var objects = [T]()
                for document in snapshot.documents {
                    let object = try document.decode(as: objectType.self)
                    objects.append(object)
                }
                completion(objects)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func update() {
       reference(to: .users).document("EPKIa2w0ml03ZpyoZzkD").setData(["email" : "michellebarrett@gmail.com" ,
                                                                "teamName" : "We are the Barretts"]) { (err) in
            if let err = err {
                print("Error updating user \(err.localizedDescription)")
            } else {
                print("User successfully updated.")
            }
        }
    }
    
    func delete() {
       reference(to: .users).document("3MgqmeuNSPCxf77cp6b0").delete()
    }
}
