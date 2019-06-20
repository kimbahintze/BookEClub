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
   func create<T: Encodable>(for encodableObject: T, in collectionReference: FIRCollectionReference) {
        do {
            let json = try encodableObject.toJson(excluding: ["id"])
            reference(to: collectionReference).addDocument(data: json)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func read<T: Decodable>(from collectionReference: FIRCollectionReference, returning objectType: T.Type, completion: @escaping ([T]) -> Void) {
        
        reference(to: collectionReference).addSnapshotListener { (snapshot, err) in
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
    
    func update<T: Encodable & Identifiable>(for encodableObject: T, in collectionReference: FIRCollectionReference) {
        do {
            let json = try encodableObject.toJson(excluding: ["id"])
            guard let id = encodableObject.id else { throw MyError.encodingError }
            reference(to: collectionReference).document(id).setData(json)
            
        } catch {
            print("Error updating user \(error.localizedDescription)")
        }
    }
    
    func delete<T: Identifiable>(_ identifiableObject: T, collectionReference: FIRCollectionReference) {
        do {
            guard let id = identifiableObject.id else { throw MyError.encodingError }
            reference(to: collectionReference).document(id).delete()
        } catch {
            print(error.localizedDescription)
        }
    }
}
