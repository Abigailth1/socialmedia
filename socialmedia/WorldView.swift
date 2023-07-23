// WorldView.swift

import SwiftUI

struct WorldView: View {
    @State private var showingCreateProjectSheet = false

    // Create an instance of WorldViewModel and use @StateObject to manage its lifecycle
    @StateObject private var viewModel = WorldViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // List of projects
                List(viewModel.projects, id: \.id) { project in
                    NavigationLink(destination: ProjectDetailsView(project: $viewModel.projects[getIndex(for: project)])) {
                        VStack(alignment: .leading) {
                            Text(project.title)
                                .font(.headline)
                            Text(project.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .listStyle(PlainListStyle())

                // Add the "add project" button here
                Button(action: {
                    showingCreateProjectSheet = true // Show the sheet when the button is tapped
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("World") // Set the title of the NavigationBar
        }
        .sheet(isPresented: $showingCreateProjectSheet) {
            // Present the CreateProjectView as a sheet and pass the projects array as a binding to CreateProjectView
            CreateProjectView(projects: $viewModel.projects)
                .environmentObject(viewModel) // Pass the WorldViewModel to CreateProjectView using environmentObject(_:)
        }
        .onAppear {
            // Load any initial data here if needed
        }
    }

    // Helper function to get the index of the project in the projects array
    private func getIndex(for project: Project) -> Int {
        guard let index = viewModel.projects.firstIndex(where: { $0.id == project.id }) else {
            fatalError("Project not found in the array")
        }
        return index
    }
}
