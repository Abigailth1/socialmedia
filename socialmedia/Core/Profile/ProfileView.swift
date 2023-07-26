//
//  ProfileView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var projects: [Project] {
        return Project.MOCK_POSTS.filter { $0.user?.username == user.username}
    }
    
    var body: some View {
//        NavigationStack {
            ScrollView {
                //header
                ProfileHeaderView(user: user)
                //post grid view
                
                LazyVStack( spacing: 1) {
                    ForEach(projects) { project in
                        ProjectListItem(project: project)
                    }
                    Divider()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
//        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
