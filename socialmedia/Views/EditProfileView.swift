//
//  EditProfileView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct EditProfileView: View {
    @Binding var editedProfile: UserProfile
    @Binding var isEditing: Bool

    var body: some View {
        VStack {
            // Add UI elements to edit the profile information, for example:
            TextField("Name", text: $editedProfile.name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.horizontal, 10)

            TextField("Role", text: $editedProfile.role)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.horizontal, 10)

            // Add more fields for editing other profile information

            Button(action: {
                // Save the changes and exit editing mode
                isEditing = false
            }) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            Button {
                AuthViewModel.shared.signout()
            } label: {
                Text("Sign Out")
                    .foregroundColor(.white)
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .frame(maxWidth: 150)
            .background(Color.red)
            .cornerRadius(5)
            .padding(.horizontal)
            
        }
        .padding()
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(editedProfile: .constant(UserProfile.init(id: "id", name: "name", role: "role", interests: ["eating"])), isEditing: .constant(true))
    }
}
