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
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    //checks if user is logged into app
    init() {
        
        
        Task { try await loadUserData() }
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
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Failed to reigster user with error \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        
        guard let currentUid = self.userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        self.currentUser = try? snapshot.data(as: User.self)
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
