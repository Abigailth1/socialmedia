//
//  LoginView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var showCreateAccount = false
//    @State private var email: String = ""
    @State private var username: String = ""
//    @State private var password: String = ""
    @State private var isCreateAnAccountShown: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var isHomePageShown: Bool = false
    @StateObject var viewModel = LoginViewModel()
    
    //    func login() {
    //        Auth.auth().signIn(withEmail: email, password: password) { _, error in
    //            if let error = error {
    //                print("Registration error: \(error.localizedDescription)")
    //            } else {
    //                print("User registered successfully!")
    //                //                isRegistered = true
    //                //                saveUserData()
    //                //                isVerificationCodeShown = true
    //            }
    //        }
    //    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Spacer()
                
                //Logo Image
                ZStack {
                    Circle()
                        .foregroundColor(.black)
                        .frame(width: 150, height: 150)
                    
                    Text("Logo")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding(.top, 50)
                
                //Text
                VStack {
                    TextField("Username", text: $viewModel.email)
                        .modifier(TextFieldModifier())
                    
                    SecureField("Password", text: $viewModel.password)
                        .modifier(TextFieldModifier())
                }
                
                Button {
                    print("Show forgot password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 30)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    Task{ try await viewModel.signIn() }
                } label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding(.top, 50)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        // handle google login
                        print("Google button tapped")
                    }) {
                        Image("google_logo")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // handle facebook login
                        print("Facebook button tapped")
                    }) {
                        Image("facebook_logo")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // handle pinterest login
                        print("Pinterest button tapped")
                    }) {
                        Image("pinterest_logo")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
                
                Divider()
                
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    NavigationLink {
                        CreateAccountView()
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
        }
    }
    
    //        VStack {
    //            ZStack {
    //                Circle()
    //                    .foregroundColor(.black)
    //                    .frame(width: 150, height: 150)
    //
    //                Text("Logo")
    //                    .font(.title)
    //                    .foregroundColor(.white)
    //            }
    //            .padding(.top, 50)
    //
    //            Text("Ink Genius")
    //                .font(.headline)
    //                .padding(.bottom, 50)
    //
    //            TextField("Username", text: $username)
    //                .padding()
    //                .background(Color.gray.opacity(0.2))
    //                .cornerRadius(5)
    //                .padding(.horizontal, 50)
    //
    //            SecureField("Password", text: $password)
    //                .padding()
    //                .background(Color.gray.opacity(0.2))
    //                .cornerRadius(5)
    //                .padding(.horizontal, 50)
    //
    //            Button(action: {
    //                isHomePageShown = true
    //            }) {
    //                Text("Log In")
    //                    .font(.headline)
    //                    .foregroundColor(.white)
    //                    .padding()
    //                    .frame(width: 200, height: 50)
    //                    .background(Color.black)
    //                    .cornerRadius(10)
    //                    .padding(.top, 5)
    //            }
    //
    //            HStack {
    //                Text("Don't have an account?")
    //
    //                Button {
    //                    //signup
    //                } label: {
    //                    Text("Sign up")
    //                }
    //            }
    //            .padding(.top, 45)
    //
    //        }
    //        .fullScreenCover(isPresented: $isHomePageShown) {
    //            HomePageView()
    //        }
    
    //                Divider()
    //                    .padding(.vertical, 20)
    //
    //        HStack {
    //            Button(action: {
    //                // handle google login
    //                print("Google button tapped")
    //            }) {
    //                Image("google_logo")
    //                    .resizable()
    //                    .frame(width: 60, height: 60)
    //                    .background(Color.black)
    //                    .cornerRadius(10)
    //            }
    //
    //            Button(action: {
    //                // handle facebook login
    //                print("Facebook button tapped")
    //            }) {
    //                Image("facebook_logo")
    //                    .resizable()
    //                    .frame(width: 60, height: 60)
    //                    .background(Color.black)
    //                    .cornerRadius(10)
    //            }
    //
    //            Button(action: {
    //                // handle pinterest login
    //                print("Pinterest button tapped")
    //            }) {
    //                Image("pinterest_logo")
    //                    .resizable()
    //                    .frame(width: 60, height: 60)
    //                    .background(Color.black)
    //                    .cornerRadius(10)
    //            }
    //        }
    //
    //        Button(action: {
    //            isCreateAnAccountShown = true
    //        }) {
    //            Text("Create An Account")
    //                .font(.headline)
    //                .foregroundColor(.white)
    //                .padding()
    //                .frame(width: 200, height: 50)
    //                .background(Color.black)
    //                .cornerRadius(10)
    //        }
    //        .fullScreenCover(isPresented: $isCreateAnAccountShown) {
    //            CreateAccountView()
    //        }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
