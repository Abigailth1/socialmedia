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
struct Project: Identifiable {
    let id: UUID
    var title: String
    var description: String
    var characterDescriptions: String
}


class WorldViewModel: ObservableObject {
    @Published var projects: [Project]

    init(projects: [Project]) {
        self.projects = projects
    }
}


struct ContentView2: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegisterViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView2()
                    .environmentObject(registrationViewModel)
            }else if let currentUser = viewModel.currentUser {
                //Main View
                HomePageView(editedProfile: UserProfile(name: "John Doe", role: "Writer", bio: "Bio goes here", profileImageURL: "profile_image_url", websiteURL: "website_url", socialMediaURL: "social_media_url", interests: ["Writing", "Reading"]))
            }
        }

    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
