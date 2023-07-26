import SwiftUI
import Firebase
import FirebaseCore
import Foundation
import Combine

enum AccountType: String {
    case personal
    case studio
    case business
}

struct Employee: Identifiable {
    let id: UUID = UUID()
    let name: String
    let role: String
}

enum Tab {
    case feed
    case explore
    case notifications
    case world
    case messages
    case profile
    case ai
}

enum LeftSwipe {
    case originals
    case daily
    case genres
}

struct UserProfile {
    var id: String // Change 'Binding<String>' to 'String'
    var name: String
    var role: String
    var bio: String?
    var profileImageURL: String?
    var websiteURL: String?
    var socialMediaURL: String?
    var interests: [String]
}

class ProjectDetailsViewModel: ObservableObject {
    @Published var project: Project

    init(project: Project) {
        self.project = project
    }

    func updateProject(_ project: Project) {
        self.project = project
    }
}

//Project
struct Project: Identifiable, Codable, Hashable {
    let id: UUID = UUID()
    var title: String
    var description: String
    var characterDescriptions: String
    var isPublished: Bool
    var coverImageURL: URL?
    var author: String
    var likes: Int
    var comments: [Comment] // Add the 'comments' property

    // Add any other properties and methods as needed

    // Provide a custom initializer if needed
    init(id: UUID = UUID(), title: String, description: String, characterDescriptions: String, isPublished: Bool, coverImageURL: URL?, author: String, likes: Int = 0, comments: [Comment] = []) { // Add default values for 'likes' and 'comments'
        self.title = title
        self.description = description
        self.characterDescriptions = characterDescriptions
        self.isPublished = isPublished
        self.coverImageURL = coverImageURL
        self.author = author
        self.likes = likes
        self.comments = comments // Initialize 'comments' with the provided value or an empty array
        
    }
    
    private enum CodingKeys : String, CodingKey { case title, description, characterDescriptions, isPublished, coverImageURL, author, likes, comments }
    
    static func == (lhs: Project, rhs: Project) -> Bool {
            return lhs.id == rhs.id && lhs.title == rhs.title && lhs.description == rhs.description && lhs.characterDescriptions == rhs.characterDescriptions && lhs.isPublished == rhs.isPublished && lhs.coverImageURL == rhs.coverImageURL && lhs.author == rhs.author && lhs.likes == rhs.likes && lhs.comments == rhs.comments
        }
    
    
    
}


class WorldViewModel: ObservableObject {
    @Published var projects: [Project]

    init(projects: [Project]) {
        self.projects = projects
    }
}





struct ContentView2: View {
    let userID: String
    @State private var yourProjectsArray: [Project] = []
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegisterViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView2()
                    .environmentObject(registrationViewModel)
            }else if let currentUser = viewModel.currentUser {
                //Main View
                NavigationView {
                    HomePageView(editedProfile: UserProfile(id: userID, name: "John Doe", role: "Writer", bio: "Bio goes here", profileImageURL: "profile_image_url", websiteURL: "website_url", socialMediaURL: "social_media_url", interests: ["Writing", "Reading"]))
                }
            }
        }

    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
