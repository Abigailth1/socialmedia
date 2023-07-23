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

struct AddProjectView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var isProjectTitleEmpty = false

    let onAdd: (String, String) -> Void

    var body: some View {
        NavigationView {
            VStack {
                TextField("Project Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Text("Add a brief description:")
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)

                TextEditor(text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Add Project") {
                    if title.isEmpty {
                        isProjectTitleEmpty = true
                    } else {
                        onAdd(title, description)
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.top, 20)

                Spacer()
            }
            .padding()
            .navigationBarTitle("Add Project", displayMode: .inline)
            .alert(isPresented: $isProjectTitleEmpty) {
                Alert(title: Text("Project Title is Empty"), message: Text("Please enter a title for the project."), dismissButton: .default(Text("OK")))
            }
        }
    }
}
