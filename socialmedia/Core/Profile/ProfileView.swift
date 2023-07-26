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
                VStack(spacing: 10) {
                    HStack {
                        if let profileImage = user.profileImageUrl {
                            Image(profileImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }else{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 10) {
                            UserStatView(value: 3, title: "Posts")
                            
                            UserStatView(value: 3, title: "Followers")
                            
                            UserStatView(value: 3, title: "Following")
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(user.username)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        if let bio = user.bio {
                            Text(bio)
                                .font(.footnote)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Divider()
                }
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
