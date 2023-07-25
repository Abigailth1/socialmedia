//
//  ProjectListView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct ProjectListView: View {
    @Binding var projects: [Project]

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(projects) { project in
                        NavigationLink(destination: ProjectDetailsView(project: $projects[getIndex(for: project)])) {
                            ProjectListItem(project: project)
                        }
                    }
                }
                .listStyle(PlainListStyle())

                Spacer()
            }
            .navigationBarTitle("Projects", displayMode: .large)
            .navigationBarItems(trailing: addButton)
        }
    }

    // Helper function to get the index of the project in the projects array
    private func getIndex(for project: Project) -> Int {
        guard let index = projects.firstIndex(where: { $0.id == project.id }) else {
            fatalError("Project not found in the array")
        }
        return index
    }

    // Add project button
    private var addButton: some View {
        Button(action: {
            // Show the CreateProjectView as a sheet to create a new project
            //showingCreateProjectSheet = true
        }) {
            Image(systemName: "plus")
        }
    }
}


struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView(projects: .constant([Project.init(title: "title", description: "description", characterDescriptions: "Character Description", isPublished: true, coverImageURL: URL?.none, author: "author")]))
    }
}
