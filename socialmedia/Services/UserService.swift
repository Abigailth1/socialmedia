//
//  UserService.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/26/23.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        return snapshot.documents.compactMap( { try? $0.data(as: User.self) } )
    }
}
