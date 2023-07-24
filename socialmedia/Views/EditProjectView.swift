//
//  EditProjectView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct EditProjectView: View {
    @Binding var project: Project

    var body: some View {
        Form {
            Section(header: Text("Edit Project")) {
                TextField("Title", text: $project.title)
                TextField("Description", text: $project.description)
                TextField("Character Descriptions", text: $project.characterDescriptions)
                // Add more fields for other project details...
            }
        }
        .navigationBarTitle("Edit Project")
        .navigationBarItems(trailing: Button("Save", action: saveProject))
    }

    private func saveProject() {
        // Save the changes made to the project
        // You can update the project in the projects array or save it to a backend database
    }
}


struct EditProjectView_Previews: PreviewProvider {
    static var previews: some View {
        EditProjectView(project: .constant(Project.init(id: UUID(), title: "title", description: "description", characterDescriptions: "Character Description")))
    }
}
