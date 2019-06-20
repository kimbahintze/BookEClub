//
//  BooksMC.swift
//  BookEClub
//
//  Created by Kimba Hintze on 3/4/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class BooksMC {
    
    private init() {}
    static let shared = BooksMC()
    
    let bookRef = Firestore.firestore().collection("books")
    
    func addBook() {
       
    }
    
//    var firestore: Firestore { get }
    
//    static var books: [Book] {
//
//        let nanPig = Book(name: "The Adventures of Nanny Piggins", picture: "nanPig1")
//
//        return [nanPig]
//    }
//
//    func getDocuments(source: FirestoreSource, completion: @escaping FIRQuerySnapshotBlock){
//
//    }
    
}

//class ChaptersMC {
//
//    static var chapter: [Chapters] {
//        let nanPigChp = Chapters(name: "The Adventures of Nanny Piggins",
//                                 picture: "nanPig1",
//                                 chp1: "Chapter 1",
//                                 q1: "If you could have any animal to be your nanny, which would you choose? Draw a picture of your animal nanny (“animanny” for short) below",
//                                 chp2: "Chapter 2",
//                                 q2: "Design your own school uniform",
//                                 chp3: "Chapter 3",
//                                 q3: "Draw your self-portrait",
//                                 chp4: "Chapter 4",
//                                 q4: "Draw a meal Nanny Piggins would love on the plate below",
//                                 chp5: "Chapter 5",
//                                 q5: "What would be another great challenge for a nanny skills test?",
//                                 chp6: "Chapter 6",
//                                 q6: "Where would you go if you could sail anywhere?",
//                                 chp7: "Chapter 7",
//                                 q7: "What household chore do you think would be the worst punishment?",
//                                 chp8: "Chapter 8",
//                                 q8: "What do you think would be a good hobby for Mr. Green?",
//                                 chp9: "Chapter 9",
//                                 q9: "Nanny Piggins has 13 sisters! We know that Nanny Piggins and her sister Katerina are very different. What might her others sisters be like? Imagine you met another one of Nanny Piggins sisters. What is she like? You can choose from: Anthea, Beatrice, Abigail, Gretel, Deidre, Jeanette, Ursula, Charlotte, Wendy, Nadia, Sophia or Sue. Draw her below and describe her personality",
//                                 chp10: "Chapter 10",
//                                 q10: "Would you rather participate in a pie eating or pie baking competition? What is your favorite pie? If you had to be in a food eating competition, what food would you want it to be?",
//                                 chp11: "Chapter 11",
//                                 q11: "Hooray!!! You finished the book! Now it’s time for the final project! Choose one project from the ideas below: -Act out a favorite scene from the book and video your performance.-Write (or tell) your own version of what adventure Nanny Piggins, Boris and the children may have next. -Draw a picture of your favorite character.")
//        return [nanPigChp]
//    }
// }
