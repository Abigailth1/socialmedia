//
//  EditProjectView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct EditProjectView: View {
    @Binding var project: Project
    @State private var characterDescriptions: String = ""
    @State private var coverImageURL: String = ""
    @State private var author: String = ""

    init(project: Binding<Project>) {
        self._project = project
        self._characterDescriptions = State(initialValue: self.project.characterDescriptions)
        self._coverImageURL = State(initialValue: self.project.coverImageURL?.absoluteString ?? "")
        self._author = State(initialValue: self.project.author)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Project Title", text: $project.title)
                TextField("Project Description", text: $project.description)
                TextField("Character Descriptions", text: $characterDescriptions)
                // Add more editable fields as needed

                // For the cover image URL, you can use a TextField or other appropriate input method
                TextField("Cover Image URL", text: $coverImageURL)

                // For the author, use a TextField or other appropriate input method
                TextField("Author", text: $author)
                
            }
            .navigationBarTitle("Edit Project", displayMode: .inline)
            .navigationBarItems(trailing: saveButton)
            
            
            
            
        }
    }

    private var saveButton: some View {
        Button(action: {
            // Update the project properties with the edited values
            project.characterDescriptions = characterDescriptions
            project.coverImageURL = URL(string: coverImageURL)
            project.author = author

            // Perform any necessary save operations here
            // For example, you might want to save changes to the backend or database

            // Dismiss the view after saving
            // No need for presentationMode.dismiss() here as it is handled automatically by the sheet
        }) {
            Text("Save")
        }
    }
}


struct EditProjectView_Previews: PreviewProvider {
    static var previews: some View {
        EditProjectView(project: .constant(Project.init(title: "title", description: "description", characterDescriptions: "Character Description", isPublished: true, coverImageURL: URL?.none , author: "String")))
    }
}
