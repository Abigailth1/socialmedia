//
//  AuthViewModel.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthViewModel {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    //checks if user is logged into app
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to log in user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Did create user...")
            await uploadUserData(uid: result.user.uid, username: username, email: email)
            print("DEBUG: Didupload user data...")
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
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {  return }
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
