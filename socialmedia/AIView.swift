import SwiftUI

struct AIView: View {
    @State private var userInput: String = ""
    @State private var generatedIdea: String = ""
    @State private var showingCreateProjectSheet = false

    var body: some View {
        VStack {
            Image("robot") // Add a robot illustration here
                .resizable()
                .frame(width: 120, height: 120)
                .padding(.bottom, 20)

            TextField("Enter your writing...", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                generatedIdea = generateIdea(using: userInput)
            }) {
                Text("Generate Idea")
                    .padding()
            }
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.bottom, 20)

            Text("Generated Idea:")
                .font(.headline)

            Text(generatedIdea)
                .padding()

            // Add a button to create a project
            Button(action: {
                showingCreateProjectSheet = true
            }) {
                Text("Create Project")
                    .padding()
            }
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(10)
            .padding(.bottom, 20)
            .sheet(isPresented: $showingCreateProjectSheet) {
                // Present the CreateProjectView as a sheet and pass the generated idea as a default project title
                //CreateProjectView(projects: generatedIdea)
            }

            // Add other AI functionalities' UI elements and interactions here
        }
        .padding()
        .foregroundColor(.white)
        .background(Color(red: 0.2, green: 0.2, blue: 0.2)) // Custom robot-themed background color
        .edgesIgnoringSafeArea(.all)
    }

    private func generateIdea(using userInput: String) -> String {
        // Implement the idea generation logic using a pre-trained language model or other AI algorithms
        // For simplicity, this example returns a hardcoded idea.
        return "Write a story about a mysterious island hidden in the clouds."
    }
}
