import SwiftUI

struct WorldView: View {
    @Binding var projects: [Project]
    @State private var selectedProject: Project?

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(projects) { project in
                        ProjectListItem(project: project)
                            .onTapGesture {
                                selectedProject = project
                            }
                    }
                }
                .listStyle(PlainListStyle())

                Spacer()
            }
            .navigationBarTitle("Projects", displayMode: .large)
            .navigationBarItems(trailing: addButton)
            .sheet(item: $selectedProject) { project in
                NavigationView {
                    ProjectDetailsView(project: $projects[getIndex(for: project)])
                        .navigationBarItems(trailing: editButton)
                }
            }
        }
    }

    // ... (rest of the code remains the same)
    
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
            selectedProject = nil // Reset the selectedProject to nil before showing the sheet
            // Show the CreateProjectView as a sheet to create a new project
        }) {
            Image(systemName: "plus")
        }
    }

    // Edit project button in the details view
    private var editButton: some View {
        Button(action: {
            // Show the EditProjectView as a sheet to edit the project details
            selectedProject = nil // Reset the selectedProject to nil before showing the sheet
        }) {
            Image(systemName: "pencil")
        }
    }
}


struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView(projects: .constant([Project.init(id: UUID(), title: "title", description: "description", characterDescriptions: "Character Description")]))
    }
}
