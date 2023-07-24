//
//  ProjectDetailsView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct ProjectDetailsView: View {
    @Binding var project: Project

    var body: some View {
        VStack {
            Text(project.title)
                .font(.title)
                .padding()

            Text(project.description)
                .font(.body)
                .padding()

            // Add more project details as needed

            Spacer()
        }
        .navigationBarTitle("Project Details", displayMode: .inline)
    }
}


struct ProjectDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailsView(project: .constant(Project.init(id: UUID(), title: "title", description: "description", characterDescriptions: "Character Description")))
    }
}
