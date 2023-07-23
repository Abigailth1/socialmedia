//
//  RegisterViewModel.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/19/23.
//

import Foundation
 
class RegisterViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var alias = ""
    @Published var companyName = ""
    @Published var phoneNumber = ""
    
    func createUser() async throws {
       try await  AuthViewModel.shared.createUser(withEmail: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
    }
}
