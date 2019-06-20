//
//  User.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/7/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import Foundation

protocol Identifiable {
    var id: String? { get set }
}

struct User: Codable, Identifiable {
    var id: String? = nil
    let teamName : String
    let email : String
    
    init(teamName: String, email: String) {
        self.teamName = teamName
        self.email = email
    }
}
