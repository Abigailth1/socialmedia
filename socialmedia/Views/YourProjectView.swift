//
//  YourProjectView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct YourProjectView: View {
    var project: Project

    var body: some View {
        // Custom view for displaying your project details
        VStack {
            Text(project.title)
            // Add other project details as needed
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
    }
}

struct YourProjectView_Previews: PreviewProvider {
    static var previews: some View {
        YourProjectView(project: Project.init(title: "title", description: "description", characterDescriptions: "Character Description", isPublished: true, coverImageURL: URL?.none , author: "String"))
    }
}
