//
//  LoginViewModel.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/23/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthViewModel.shared.login(withEmail: email, password: password)
    }
}
