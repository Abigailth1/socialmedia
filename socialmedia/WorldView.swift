import SwiftUI

struct WorldView: View {
    @Binding var projects: [Project]
    @State private var selectedProject: Project? = nil
    @State private var showingCreateProjectSheet = false
    @State private var isPublished = false
    @State private var selectedProjectForPublishing: Project? = nil

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
            .sheet(isPresented: $showingCreateProjectSheet) {
                CreateProjectView(projects: $projects, isPublished: $isPublished, title: "", description: "")
            }
            .alert(isPresented: $isPublished) {
                Alert(title: Text("Project Published"), message: Text("The project has been published to the feed."), dismissButton: .default(Text("OK")))
            }
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
            selectedProject = nil
            showingCreateProjectSheet = true // Show the CreateProjectView as a sheet
        }) {
            Image(systemName: "plus")
        }
    }

    // Edit project button in the details view
    private var editButton: some View {
        Button(action: {
            selectedProject = nil
        }) {
            Image(systemName: "pencil")
        }
    }
}

struct ProjectListItem: View {
    var project: Project

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(project.title)
                    .font(.headline)
                Text(project.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
    }
}

struct ProjectDetailsView: View {
    @Binding var project: Project

    var body: some View {
        VStack {
            Text(project.title)
                .font(.title)
                .padding()

            Text(project.description)
                .font(.body)
                .padding()

            // Add more project details as needed

            Spacer()
        }
        .navigationBarTitle("Project Details", displayMode: .inline)
    }
}
