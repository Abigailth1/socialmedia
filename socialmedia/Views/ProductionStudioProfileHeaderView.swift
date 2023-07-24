//
//  ProductionStudioProfileHeaderView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct ProductionStudioProfileHeaderView: View {
    let studioName: String
    let role: String?
    let websiteURL: String?
    let socialMediaURL: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(studioName)
                .font(.title)
                .foregroundColor(.black)

            if let role = role {
                Text("Role: \(role)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            if let websiteURL = websiteURL {
                Link(destination: URL(string: websiteURL)!) {
                    HStack {
                        Image(systemName: "globe")
                        Text("Website")
                    }
                }
            }

            if let socialMediaURL = socialMediaURL {
                Link(destination: URL(string: socialMediaURL)!) {
                    HStack {
                        Image(systemName: "link")
                        Text("Social Media")
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}


struct ProductionStudioProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProductionStudioProfileHeaderView(studioName: "Studio Name", role: "role", websiteURL: "web URL", socialMediaURL: "social URL")
    }
}
