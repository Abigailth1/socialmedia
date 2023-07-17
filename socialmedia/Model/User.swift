//
//  User.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/17/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: <#T##String?#>, fullname: "Bruce Wayne", bio: "Gothman's Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", profileImageUrl: <#T##String?#>, fullname: "Eddie Brock", bio: "Venom", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ironman", profileImageUrl: <#T##String?#>, fullname: "Tony Stark", bio: "Playboy & Billionaire", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "blackpanther", profileImageUrl: <#T##String?#>, fullname: "Bruce Wayne", bio: "Test Bio", email: "blackpanther@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spiderman", profileImageUrl: <#T##String?#>, fullname: "Peter Parker", bio: "Test Bio", email: "spiderman@gmail.com"),
    ]
}
