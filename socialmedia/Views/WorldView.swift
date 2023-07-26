import SwiftUI

struct WorldView: View {
    @Binding var projects: [Project]
    @State private var selectedProject: Project? = nil
    @State private var showingCreateProjectSheet = false
    @State private var showingEditProjectSheet = false
    @State private var isPublished = false
    @State private var selectedProjectForPublishing: Project? = nil
    @State private var feedProjects: [Project] = [] // Array to hold projects posted to the feed

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
                    ProjectDetailsView(project: $projects[getIndex(for: project)]) {
                        // Delete button action in ProjectDetailsView
                        projects.removeAll(where: { $0.id == project.id })
                        selectedProject = nil
                    }
                    .navigationBarItems(leading: postButton, trailing: editButton) // Added postButton here
                }
            }
            .sheet(isPresented: $showingCreateProjectSheet) {
                CreateProjectView(projects: $projects, isPublished: $isPublished, title: "", description: "")
            }
            .sheet(isPresented: $showingEditProjectSheet) {
                if let selectedProject = selectedProjectForPublishing {
                    EditProjectView(project: $projects[getIndex(for: selectedProject)])
                }
            }
            .alert(isPresented: $isPublished) {
                Alert(title: Text("Project Published"), message: Text("The project has been published to the feed."), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func getIndex(for project: Project) -> Int {
        guard let index = projects.firstIndex(where: { $0.id == project.id }) else {
            fatalError("Project not found in the array")
        }
        return index
    }

    private var addButton: some View {
        Button(action: {
            selectedProject = nil
            showingCreateProjectSheet = true // Show the CreateProjectView as a sheet
        }) {
            Image(systemName: "plus")
        }
    }

    private var editButton: some View {
        Button(action: {
            showingEditProjectSheet = true
        }) {
            Image(systemName: "pencil")
        }
    }

    private var postButton: some View {
        Button(action: {
            if let project = selectedProjectForPublishing {
                // Add the selected project to the feedProjects array
                feedProjects.append(project)

                // Assuming you have a function to post the project to the feed
                postProjectToFeed(project)

                // Set the flag to show the "Project Published" alert
                isPublished = true
            }
        }) {
            Image(systemName: "square.and.arrow.up")
        }
    }

    // Function to post the project to the feed (replace this with your actual implementation)
    private func postProjectToFeed(_ project: Project) {
        // Implement your code to post the project to the feed here
        // For example, you might update a backend database or a server with the posted project
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView(projects: .constant(Project.MOCK_POSTS))
    }
}
