//
//  HomePageView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI

struct HomePageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab : Tab = .feed
    @State private var bottomSafeAreaInset: CGFloat = 0
    @State private var accountType: AccountType = . personal
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            if accountType == .personal {
                PersonalFeedView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Feed")
                    }
                    .tag(Tab.feed)
            } else {
                BusinessFeedView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Feed")
                    }
                    .tag(Tab.feed)
            }
            
            ExploreView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                .tag(Tab.explore)
            
            NotificationsView()
                .tabItem{
                    Image(systemName: "shareplay")
                    Text("AI")
                }
                .tag(Tab.notifications)
            
            MessagesView()
                .tabItem {
                    Image(systemName: "book")
                    Text("World")
                }
                .tag(Tab.messages)
            
            if accountType == .personal {
                PersonalProfileView()
                    .tabItem{
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(Tab.profile)
            } else {
                BusinessProfileView()
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
                .onAppear{
                    updateBottomSafeAreaInset()
                }
                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                    updateBottomSafeAreaInset()
                }
        )
    }
    
    private func updateBottomSafeAreaInset() {
        guard let keyWindow = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow }) else {
            return
        }
        bottomSafeAreaInset = keyWindow.safeAreaInsets.bottom
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
