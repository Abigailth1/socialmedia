//
//  HomePageView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct HomePageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab: Tab = .feed
    @State private var bottomSafeAreaInset: CGFloat = 0
    @State private var accountType: AccountType = .personal

    @State private var projects: [Project] = [
        Project(id: UUID(), title: "Hello World", description: "Description of Project 1", characterDescriptions: "Character Des 1", isPublished: false, coverImageURL: URL(string: "https://example.com/book1.jpg"), author: "Author 1"),
        Project(id: UUID(), title: "Project 2", description: "Description of Project 2", characterDescriptions: "Character Des 2", isPublished: false, coverImageURL: URL(string: "https://example.com/book2.jpg"), author: "Author 2"),
        Project(id: UUID(), title: "Project 3", description: "Description of Project 3", characterDescriptions: "Character Des 3", isPublished: false, coverImageURL: URL(string: "https://example.com/book3.jpg"), author: "Author 3"),
    ]



    @State private var yourProjectsArray: [Project] = []
    @State private var editedProfile: UserProfile

    @State private var publishedProjects: [Project] = []

    public init(editedProfile: UserProfile) {
        self._editedProfile = State(initialValue: editedProfile)
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            if accountType == .personal {
                FeedView(feedProjects: $projects)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Feed")
                    }
                    .tag(Tab.feed)
            } else {
                BusinessFeedView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Feed")
                    }
                    .tag(Tab.feed)
            }

            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                .tag(Tab.explore)

            AIView()
                .tabItem {
                    Image(systemName: "shareplay")
                    Text("AI")
                }
                .tag(Tab.ai)

            WorldView(projects: $projects)
                .tabItem {
                    Image(systemName: "book")
                    Text("World")
                }
                .tag(Tab.world)

            if accountType == .personal {
                PersonalProfileView(userProfile: editedProfile, projects: projects)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(Tab.profile)
            } else {
                ProductionStudioProfileView(userProfile: editedProfile)
                    .tabItem {
                        Image(systemName: "business")
                        Text("Profile")
                    }
                    .tag(Tab.profile)
            }
        }
        .accentColor(.primary)
        .navigationBarHidden(true)
        .overlay(
            HStack(spacing: 0) {
                Spacer()

                Button(action: {
                    selectedTab = .messages
                }) {
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(9)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(.bottom, bottomSafeAreaInset)
                .offset(x: -5, y: 250)
            }
            .onAppear {
                updateBottomSafeAreaInset()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                updateBottomSafeAreaInset()
            }
        )
    }

    private func updateBottomSafeAreaInset() {
        guard let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
            return
        }
        bottomSafeAreaInset = keyWindow.safeAreaInsets.bottom
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(editedProfile: UserProfile.init(id: "id", name: "name", role: "role", interests: ["eating"]))
    }
}
