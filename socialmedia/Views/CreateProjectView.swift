import SwiftUI

struct CreateProjectView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String
    @State private var description: String
    @State private var characterDescriptions: String // Add characterDescriptions state

    @Binding var projectsBinding: [Project]

    init(projects: Binding<[Project]>, defaultTitle: String = "") {
        _title = State(initialValue: defaultTitle)
        _description = State(initialValue: "")
        _characterDescriptions = State(initialValue: "") // Initialize characterDescriptions state
        _projectsBinding = projects
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                TextField("Character Descriptions", text: $characterDescriptions) // Add characterDescriptions TextField
            }
            .navigationBarTitle("Create Project", displayMode: .inline)
            .navigationBarItems(trailing: saveButton)
        }
    }

    private var saveButton: some View {
        Button("Save") {
            // Validate the title is not empty
            guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                print("Please enter a title for the project.")
                return
            }

            // Create a new project with the entered details and add it to the projects array
            let newProject = Project(id: UUID(), title: title, description: description, characterDescriptions: characterDescriptions)
            projectsBinding.append(newProject)

            // Dismiss the sheet
            presentationMode.wrappedValue.dismiss()
        }
    }
}
