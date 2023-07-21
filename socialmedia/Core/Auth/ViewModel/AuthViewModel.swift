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
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        
    }
}
