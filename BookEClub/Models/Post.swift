//
//  Post.swift
//  BookEClub
//
//  Created by Kimba Hintze on 2/11/19.
//  Copyright © 2019 Kim Lundquist. All rights reserved.
//

import Foundation

class Post: Equatable {
    
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
