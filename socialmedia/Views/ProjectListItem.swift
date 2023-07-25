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
            VStack(alignment: .leading, spacing: 4) {
                Text(project.title)
                    .font(.headline)
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
        ProjectListItem(project: Project.init(title: "title", description: "description", characterDescriptions: "Character Description", isPublished: true, coverImageURL: URL?.none, author: "author"))
    }
}
