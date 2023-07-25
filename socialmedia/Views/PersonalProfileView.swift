//
//  PersonalProfileView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI

struct PersonalProfileView: View {
    @State private var isEditingProfile = false
    @State private var editedProfile: UserProfile
    var projects: [Project] // Add this line to accept projects array

    init(userProfile: UserProfile, projects: [Project]) { // Modify the init to accept projects
        self._editedProfile = State(initialValue: userProfile)
        self.projects = projects // Initialize the projects array
    }

    var body: some View {
        VStack {
            if isEditingProfile {
                EditProfileView(editedProfile: $editedProfile, isEditing: $isEditingProfile)
            } else {
                WriterProfileHeaderView(name: editedProfile.name, role: editedProfile.role, profileImageURL: editedProfile.profileImageURL)

                // Display other profile information here

                List {
                    Section(header: Text("Projects")) {
                        ForEach(projects) { project in
                            Button(action: {
                                navigateToProjectDetails(project: project)
                            }) {
                                Text(project.title)
                            }
                        }
                    }

                    Section(header: Text("Interests")) {
                        ForEach(editedProfile.interests, id: \.self) { interest in
                            Text(interest)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Profile", displayMode: .inline)

                Button(action: {
                    isEditingProfile = true
                }) {
                    Text("Edit Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .padding(.horizontal)
                }
            }
        }
        .padding()
    }

    private func navigateToProjectDetails(project: Project) {
        // Navigate to a new view displaying project details (e.g., ProjectDetailsView)
        // You can pass the selected project to the next view if needed
        // For example: NavigationLink(destination: ProjectDetailsView(project: project)) { ... }
    }
}

struct PersonalProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalProfileView(userProfile: UserProfile.init(id: "id", name: "name", role: "role", interests: ["eating"]), projects: [Project.init(title: "title", description: "description", characterDescriptions: "Character Descriptions", isPublished: true, coverImageURL: URL?.none, author: "author")])
    }
}
