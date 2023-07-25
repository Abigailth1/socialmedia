//
//  PublishedProjectView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct PublishedProjectView: View {
    var project: Project

    var body: some View {
        // Custom view for displaying published project details
        VStack {
            Text(project.title)
            // Add other project details as needed
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(10)
    }
}

struct PublishedProjectView_Previews: PreviewProvider {
    static var previews: some View {
        PublishedProjectView(project: Project.init(title: "title", description: "description", characterDescriptions: "Character Description", isPublished: true, coverImageURL: URL?.none , author: "String"))
    }
}
