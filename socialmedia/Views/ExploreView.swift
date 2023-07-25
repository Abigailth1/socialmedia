import SwiftUI

struct User2: Identifiable { // Conform to Identifiable
    let id: UUID
    let name: String
    var projects: [Project]
}

struct ExploreView: View {
    let exampleUsers: [User2] = [
        User2(id: UUID(), name: "John Doe", projects: [
            Project(id: UUID(), title: "Project 1", description: "Description of Project 1", characterDescriptions: "Character Des 1", isPublished: true, coverImageURL: URL(string: "https://example.com/project1.jpg"), author: "John Doe", likes: 10, comments: [
                Comment(id: UUID(), author: "Jane", text: "Great project!"),
                Comment(id: UUID(), author: "Bob", text: "Nice work!"),
            ]),
            Project(id: UUID(), title: "Project 2", description: "Description of Project 2", characterDescriptions: "Character Des 2", isPublished: true, coverImageURL: URL(string: "https://example.com/project2.jpg"), author: "John Doe", likes: 15, comments: [
                Comment(id: UUID(), author: "Alice", text: "Awesome project!"),
            ]),
        ]),
        User2(id: UUID(), name: "Jane Smith", projects: [
            Project(id: UUID(), title: "Project A", description: "Description of Project A", characterDescriptions: "Character Des A", isPublished: true, coverImageURL: URL(string: "https://example.com/projectA.jpg"), author: "Jane Smith", likes: 5, comments: [
                Comment(id: UUID(), author: "John", text: "Well done!"),
            ]),
        ]),
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(exampleUsers) { user in
                    Section(header: Text(user.name)) {
                        ForEach(user.projects) { project in
                            NavigationLink(destination: ProjectDetailsView(project: .constant(project))) {
                                ProjectListItem(project: project)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Explore")
        }
    }
}
struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
