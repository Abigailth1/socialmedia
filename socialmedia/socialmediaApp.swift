import SwiftUI

@main
struct socialmediaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            // Replace LoginView with HomePageView
            HomePageView(editedProfile: UserProfile(id: "your_user_id", name: "John Doe", role: "Writer", bio: "Bio goes here", profileImageURL: "profile_image_url", websiteURL: "website_url", socialMediaURL: "social_media_url", interests: ["Writing", "Reading"]))
        }
    }
}



//socialmediaApp
