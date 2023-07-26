//
//  CurrentUserProfileView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/25/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
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
        NavigationStack {
            ScrollView {
                //header
                VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        HStack(spacing: 10) {
                            UserStatView(value: 3, title: "Posts")
                            
                            UserStatView(value: 3, title: "Followers")
                            
                            UserStatView(value: 3, title: "Following")
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Bio")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Bio")
                            .font(.footnote)
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthViewModel.shared.signout()
                    }label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
