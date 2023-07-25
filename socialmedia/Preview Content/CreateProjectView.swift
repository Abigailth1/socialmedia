import SwiftUI
struct CreateProjectView: View {
    @Binding var projects: [Project]
    @Binding var isPublished: Bool
    @Environment(\.presentationMode) var presentationMode

    @State private var projectTitle: String
    @State private var projectDescription: String

    let coverImageURL = URL(string: "https://example.com/new_project_cover.jpg")
    let author = "New Project Author"

    init(projects: Binding<[Project]>, isPublished: Binding<Bool>, title: String, description: String) {
        self._projects = projects
        self._isPublished = isPublished
        self._projectTitle = State(initialValue: title)
        self._projectDescription = State(initialValue: description)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Project Details")) {
                    TextField("Project Title", text: $projectTitle)
                    TextEditor(text: $projectDescription)
                }

                Section {
                    Button("Save Project") {
                        let newProject = Project(id: UUID(), title: projectTitle, description: projectDescription, characterDescriptions: "", isPublished: false, coverImageURL: coverImageURL, author: author)

                        projects.append(newProject)
                        isPublished = true
                        presentationMode.wrappedValue.dismiss() // Dismiss the sheet after saving
                    }
                }
            }
            .navigationBarTitle("Create Project", displayMode: .inline)
            .navigationBarItems(leading: cancelButton) // Add the cancel button to the leading side
        }
    }

    private var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss() // Dismiss the sheet without saving
        }
    }
}
