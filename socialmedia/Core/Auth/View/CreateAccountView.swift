//
//  CreateAccountView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI
import Firebase

struct CreateAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegisterViewModel
    @State private var profileImage: Image? = nil
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTermsAccepted: Bool = false
    @State private var accountType: AccountType = .personal
    @State private var companyName: String = ""
    @State private var phoneNumber: String = ""
    @State private var alias: String = ""
    @State private var isVerificationCodeShown: Bool = false
    @State private var isRegistered: Bool = false
    
    var body: some View {
        VStack {
//            HStack {
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image(systemName: "arrow.left")
//                        .font(.title)
//                        .foregroundColor(.black)
//                        .padding(.leading, 10)
//                }
//                .padding(.top, 10)
//                
//                Spacer()
//            }
            Group {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .padding(.bottom, 10)
                        .background(Color.black)
                } else {
                    Button(action: {
                        print("Select profile picture tapped")
                    }) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 10)
                }
                
                Text("Create An Account")
                    .font(.title)
                    .padding(.bottom, 10)
                
                Picker("Account Type", selection: $accountType) {
                    Text("Personal").tag(AccountType.personal)
                    Text("Business").tag(AccountType.business)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
                
                TextField("Username", text: $viewModel.username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                if accountType == .business {
                    TextField("Company Name", text: $viewModel.companyName)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)
                } else {
                    TextField("Alias", text: $viewModel.alias)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)
                }
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                TextField("Phone Number", text: $viewModel.phoneNumber)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
            }
            
            Spacer()
            
            Group {
                Toggle("I agree to the Terms and Conditions", isOn: $isTermsAccepted)
                    .padding(.horizontal, 40)
                
                NavigationLink {
                    VerificationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                
//                Button(action: {
//                    registerUser()
//                }) {
//                    Text("Register")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(minWidth: 0, maxWidth: .infinity)
//                        .background(Color.black)
//                        .cornerRadius(10)
//                        .padding(.horizontal)
//                }
//                .padding(.top, 30)
            }
        }
        .fullScreenCover(isPresented: $isVerificationCodeShown) {
            VerificationView()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
    
    private func registerUser() {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                print("Registration error: \(error.localizedDescription)")
            } else {
                print("User registered successfully!")
                isRegistered = true
                saveUserData()
                isVerificationCodeShown = true
            }
        }
    }
    
    private func saveUserData() {
        let db = Firestore.firestore()
        let userDocument = db.collection("users").document(email)
        
        var accountTypeString: String = ""
        switch accountType {
        case .personal:
            accountTypeString = AccountType.personal.rawValue
        case .business:
            accountTypeString = AccountType.business.rawValue
        }
        
        let userData: [String: Any] = [
            "username": username,
            "email": email,
            "accountType": accountTypeString,
            "companyName": companyName,
            "alias": alias,
            "phoneNumber": phoneNumber
        ]
        
        userDocument.setData(userData) { error in
            if let error = error {
                print("Error saving user data: \(error.localizedDescription)")
            } else {
                print("User data saved successfully!")
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
            .environmentObject(RegisterViewModel())
    }
}
