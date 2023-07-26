//
//  LoginView2.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct LoginView2: View {
    @State private var showCreateAccount = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isCreateAnAccountShown: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var isHomePageShown: Bool = false
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Image("instagram_logo") // Replace with your Instagram logo image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 50)
                    .padding(.top, 100)
                
                TextField("Phone number, username, or email", text: $viewModel.email)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                
                SecureField("Password", text: $viewModel.password)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                
                Button(action: {
                    Task{ try await viewModel.signIn() }
                }) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue) // Blue color similar to Instagram
                        .cornerRadius(5)
                }
                
                
                
                HStack(spacing: 20) {
                    Button(action: {
                        // handle google login
                        print("Google button tapped")
                    }) {
                        Image("google_logo") // Replace with your Google logo image
                            .resizable()
                            .frame(width: 40, height: 40)
                            .background(Color(.systemGray6))
                            .cornerRadius(20)
                    }
                    
                    Button(action: {
                        // handle facebook login
                        print("Facebook button tapped")
                    }) {
                        Image("facebook_logo") // Replace with your Facebook logo image
                            .resizable()
                            .frame(width: 40, height: 40)
                            .background(Color(.systemGray6))
                            .cornerRadius(20)
                    }
                    
                    Button(action: {
                        // handle pinterest login
                        print("Pinterest button tapped")
                    }) {
                        Image("pinterest_logo") // Replace with your Pinterest logo image
                            .resizable()
                            .frame(width: 40, height: 40)
                            .background(Color(.systemGray6))
                            .cornerRadius(20)
                    }
                }
                
                Spacer()
                
                Divider()
                
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    NavigationLink {
                        CreateAccountView2()
                            .padding()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Sign up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    
                }
                .padding(.vertical, 15)
                
            }
            .padding(.horizontal, 30)
            .background(Color(red: 0.94, green: 0.94, blue: 0.96)) // Light gray background color
        }
    }
}

struct LoginView2_Previews: PreviewProvider {
    static var previews: some View {
        LoginView2()
    }
}
