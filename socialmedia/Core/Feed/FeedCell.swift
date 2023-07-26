//
//  FeedCell.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/26/23.
//

import SwiftUI

struct FeedCell: View {
    let project: Project
    
    var body: some View {
        VStack {
            HStack {
                //image
                if let user = project.user{
                    if let profileImage = project.user?.profileImageUrl {
                        Image(profileImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                
                
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing, 10)
            
            //post
            Image(systemName: "book.closed.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            //action
            HStack (spacing: 15){
                
                Button {
                    print("Like")
                } label: {
                    Image(systemName: "heart")
                }
                
                Button {
                    print("Comment")
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Spacer()
            }
            .padding(.leading, 10)
            .foregroundColor(.black)
            
            //likes
            Text("\(project.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .padding(.top, 1)
            
            HStack {
                //caption
                Text("\(project.user?.username ?? "") ").fontWeight(.semibold) +
                Text(project.description)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 12)
            .padding(.top, 1)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .padding(.top, 1)
                .foregroundColor(.gray)
            
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(project: Project.MOCK_POSTS[0])
    }
}
