//
//  Post.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/26/23.
//

import Foundation
import Firebase

struct Project: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    var title: String
    var description: String
    var characterDescriptions: String
    var isPublished: Bool?
    var coverImageURL: String?
    var author: String
    var likes: Int
    let timestamp: Timestamp
    var user: User?
    var comments: [Comment]? // Add the 'comments' property
    
    
    

    // Add any other properties and methods as needed

    // Provide a custom initializer if needed

    
    private enum CodingKeys : String, CodingKey { case id, ownerUid, title, description, characterDescriptions, isPublished, coverImageURL, author, likes, timestamp, user, comments }
    
    static func == (lhs: Project, rhs: Project) -> Bool {
            return lhs.id == rhs.id && lhs.title == rhs.title && lhs.description == rhs.description && lhs.characterDescriptions == rhs.characterDescriptions && lhs.isPublished == rhs.isPublished && lhs.coverImageURL == rhs.coverImageURL && lhs.author == rhs.author && lhs.likes == rhs.likes && lhs.comments == rhs.comments && lhs.ownerUid == rhs.ownerUid && lhs.timestamp == rhs.timestamp && lhs.user == rhs.user
        }
    
    
    
}

//struct Project: Identifiable, Hashable, Codable {
//    let id: String
//    let ownerUid: String
//    let caption: String
//    var likes: Int
//    let imageUrl: String
//    let timestamp: Date
//    var user: User?
//}

extension Project {
    static var MOCK_POSTS: [Project] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, title: "title", description: "description", characterDescriptions: "Character Description", author: "author", likes: 12, timestamp: Timestamp(), user: User.MOCK_USERS[0], comments: [Comment.init(author: "author", text: "text")]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, title: "title", description: "description", characterDescriptions: "Character Description", author: "author", likes: 12, timestamp: Timestamp(), user: User.MOCK_USERS[1], comments: [Comment.init(author: "author", text: "text")]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, title: "title", description: "description", characterDescriptions: "Character Description", author: "author", likes: 12, timestamp: Timestamp(), user: User.MOCK_USERS[2], comments: [Comment.init(author: "author", text: "text")]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, title: "title", description: "description", characterDescriptions: "Character Description", author: "author", likes: 12, timestamp: Timestamp(), user: User.MOCK_USERS[3], comments: [Comment.init(author: "author", text: "text")]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, title: "title", description: "description", characterDescriptions: "Character Description", author: "author", likes: 12, timestamp: Timestamp(), user: User.MOCK_USERS[4], comments: [Comment.init(author: "author", text: "text")]),
//        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "caption", likes: 3, imageUrl: "image", timestamp: Date(), user: User.MOCK_USERS[0]),
//        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "caption", likes: 32, imageUrl: "image", timestamp: Date(), user: User.MOCK_USERS[1]),
//        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "caption", likes: 0, imageUrl: "image", timestamp: Date(), user: User.MOCK_USERS[2]),
//        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "caption", likes: 0, imageUrl: "image", timestamp: Date(), user: User.MOCK_USERS[3]),
//        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "caption", likes: 3, imageUrl: "image", timestamp: Date(), user: User.MOCK_USERS[4]),
    ]
}
