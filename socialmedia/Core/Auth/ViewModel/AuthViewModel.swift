//
//  AuthViewModel.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import Foundation
import FirebaseAuth

class AuthViewModel {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    //checks if user is logged into app
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(withEmail email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to reigster user with error \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
