//
//  PersonalFeedView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI

struct PersonalFeedView: View {
    @Binding var publishedProjects: [Project]
    @Binding var yourProjectsArray: [Project]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(publishedProjects) { project in
                    PublishedProjectView(project: project)
                }
                ForEach(yourProjectsArray) { project in
                    YourProjectView(project: project)
                }
            }
            .padding()
        }
    }
}


struct PersonalFeedView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalFeedView(publishedProjects: .constant(Project.MOCK_POSTS), yourProjectsArray: .constant(Project.MOCK_POSTS))
    }
}
