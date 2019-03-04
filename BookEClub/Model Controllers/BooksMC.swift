//
//  BooksMC.swift
//  BookEClub
//
//  Created by Kimba Hintze on 3/4/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import Foundation

class BooksMC {
    
    static var books: [Books] {
        
        let nanPig = Books(name: "The Adventures of Nanny Piggins", picture: "nanPig1")
        
        return [nanPig]
    }
}
