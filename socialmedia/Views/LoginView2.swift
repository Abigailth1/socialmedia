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

    var body: some View {
        VStack(spacing: 20) {
            Image("instagram_logo") // Replace with your Instagram logo image
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 50)
                .padding(.top, 100)

            TextField("Phone number, username, or email", text: $username)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .cornerRadius(5)

            SecureField("Password", text: $password)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .cornerRadius(5)

            Button(action: {
                isHomePageShown = true
            }) {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue) // Blue color similar to Instagram
                    .cornerRadius(5)
            }

            Text("OR")
                .foregroundColor(Color(.systemGray))
                .padding(.vertical, 5)

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

            Button(action: {
                isCreateAnAccountShown = true
            }) {
                Text("Create New Account")
                    .font(.headline)
                    .foregroundColor(.purple) // Purple color similar to Instagram
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
            }
            .fullScreenCover(isPresented: $isCreateAnAccountShown) {
                CreateAccountView2()
            }

            Spacer()
        }
        .padding(.horizontal, 30)
        .background(Color(red: 0.94, green: 0.94, blue: 0.96)) // Light gray background color
        .edgesIgnoringSafeArea(.all) // Ignore safe area to extend the background color
    }
}

struct LoginView2_Previews: PreviewProvider {
    static var previews: some View {
        LoginView2()
    }
}
