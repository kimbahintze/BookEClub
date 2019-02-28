//
//  Post.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/11/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import Foundation
import CloudKit

class Post: Equatable {
    
    static let share = Post()
    
    var container: CKContainer!
    var publicDB: CKDatabase!
    var privateDB: CKDatabase!
    var sharedDB: CKDatabase!
    
    private init() {
        container = CKContainer.default()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
        sharedDB = container.sharedCloudDatabase
        
    }
    var projectPicURLAsString: String
    let userID: String
    var projectTitle: String
    var projectDetails: String
    let postID: String
    var flags: Int?

    init(projectPicURLAsString: String, userID: String, projectTitle: String, projectDetails: String, postID: String) {
        self.projectPicURLAsString = projectPicURLAsString
        self.userID = userID
        self.projectTitle = projectTitle
        self.projectDetails = projectDetails
        self.postID = postID
    }
}

func ==(lhs: Post, rhs: Post) -> Bool {
    return lhs.projectPicURLAsString == rhs.projectPicURLAsString && lhs.userID == rhs.userID && lhs.projectTitle == rhs.projectTitle && lhs.projectDetails == rhs.projectDetails && lhs.postID == rhs.postID
}
