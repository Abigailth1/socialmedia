//
//  CreateAccountView2.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI
import Firebase

struct CreateAccountView2: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegisterViewModel
    @State private var profileImage: Image? = nil
//    @State private var username: String = ""
//    @State private var email: String = ""
//    @State private var password = ""
//    @State private var confirmPassword = ""
    @State private var isTermsAccepted: Bool = false
    @State private var accountType: AccountType = .personal
//    @State private var companyName: String = ""
    @State private var websiteURL: String = ""
    @State private var socialMediaURL: String = ""
//    @State private var alias: String = ""
//    @State private var phoneNumber: String = ""
    @State private var isVerificationCodeShown: Bool = false
    @State private var isRegistered: Bool = false
    @State private var userProfile: UserProfile = UserProfile(id: "", name: "", role: "", bio: "", profileImageURL: "", websiteURL: "", socialMediaURL: "", interests: [])
    @State private var newInterest: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Group {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .padding(.bottom, 10)
                            .frame(width: 120, height: 120)
                    } else {
                        Button(action: {
                            print("Select profile picture tapped")
                        }) {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 100))
                                .foregroundColor(accountType == .personal ? .blue : .purple) // Personal is blue, Studio is purple
                        }
                        .padding(.bottom, 10)
                        .frame(width: 120, height: 120)
                        .background(accountType == .personal ? Color.blue : Color.purple) // Personal is blue, Studio is purple
                        .clipShape(Circle())
                    }

                    Text("Create An Account")
                        .font(.title)
                        .padding(.bottom, 10)

                    Picker("Account Type", selection: $accountType) {
                        Text("Personal").tag(AccountType.personal)
                        Text("Studio").tag(AccountType.studio)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 50)
                    .padding(.bottom, 20)

                    if accountType == .studio {
                        TextField("Studio Name", text: $viewModel.companyName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal, 10)

                        TextField("Website URL", text: $websiteURL)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal, 10)

                        TextField("Social Media URL", text: $socialMediaURL)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal, 10)
                    } else {
                        TextField("Username", text: $viewModel.username)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal, 10)

                        TextField("Alias", text: $viewModel.alias)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal, 10)
                    }

                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)

                    TextField("Phone Number", text: $viewModel.phoneNumber)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)

                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)

                    SecureField("Confirm Password", text: $viewModel.confirmPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)
                }

                Group {
                    Toggle("I agree to the Terms and Conditions", isOn: $isTermsAccepted)
                        .padding(.horizontal, 40)

                    Button(action: {
                        Task { try await viewModel.createUser() }
                    }) {
                        Text("Register")
                            .font(.headline)
                            .foregroundColor(.white) // Set the color to white
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(accountType == .personal ? Color.blue : Color.purple) // Set the background color to blue
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.top, 30)
                    .disabled(!isTermsAccepted) // Disable the button if terms are not accepted

                    List {
                        ForEach(userProfile.interests, id: \.self) { interest in
                            Text(interest)
                        }
                        .onDelete(perform: deleteInterest)
                    }
                    .listStyle(PlainListStyle())

                    TextField("Add Interest", text: $newInterest)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)

                    Button(action: addInterest) {
                        Text("Add")
                            .foregroundColor(.blue)
                    }
                    .padding(.bottom)
                }
            }
            .padding() // Add overall padding
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        .fullScreenCover(isPresented: $isVerificationCodeShown) {
            VerificationView2(userID: userProfile.id) // Pass the user ID here
        }
    }

//    private func registerUser() {
//        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//            if let error = error {
//                print("Registration error: \(error.localizedDescription)")
//            } else {
//                if let authResult = authResult {
//                    print("User registered successfully!")
//                    isRegistered = true
//                    userProfile.id = authResult.user.uid // Set the user ID after successful registration
//                    saveUserProfileData()
//                }
//            }
//        }
//    }

//    private func saveUserProfileData() {
//        let db = Firestore.firestore()
//        let userDocument = db.collection("users").document(email)
//
//        let userData: [String: Any] = [
//                    // Existing code...
//                    "name": userProfile.name,
//                    "role": userProfile.role,
//                    "bio": userProfile.bio ?? "", // Add a default value for bio
//                    "profileImageURL": userProfile.profileImageURL ?? "", // Add a default value for profileImageURL
//                    "websiteURL": userProfile.websiteURL ?? "", // Add a default value for websiteURL
//                    "socialMediaURL": userProfile.socialMediaURL ?? "", // Add a default value for socialMediaURL
//                    "interests": userProfile.interests,
//                ]
//        userDocument.setData(userData) { error in
//            if let error = error {
//                print("Error saving user data: \(error.localizedDescription)")
//            } else {
//                print("User data saved successfully!")
//            }
//        }
//    }

    private func addInterest() {
        if !newInterest.isEmpty {
            userProfile.interests.append(newInterest)
            newInterest = ""
        }
    }

    private func deleteInterest(at offsets: IndexSet) {
        userProfile.interests.remove(atOffsets: offsets)
    }
}


struct CreateAccountView2_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView2()
    }
}
