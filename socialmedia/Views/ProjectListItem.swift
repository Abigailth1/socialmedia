//
//  ProjectListItem.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct ProjectListItem: View {
    var project: Project

    var body: some View {
        HStack {
            if let coverImage = project.coverImageURL {
                Image(coverImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .padding(.trailing)
            } else {
                Image(systemName: "book.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .padding(.trailing)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(project.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(project.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
    }
}

struct ProjectListItem_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListItem(project: Project.MOCK_POSTS[0])
    }
}
