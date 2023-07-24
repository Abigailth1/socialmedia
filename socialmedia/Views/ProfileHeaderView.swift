//
//  ProfileHeaderView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let accountType: AccountType
    let studioName: String
    let role: String?
    let websiteURL: String?
    let socialMediaURL: String?
    let interests: [String]

    var body: some View {
        VStack(spacing: 10) {
            if accountType == .studio {
                Image(systemName: "film")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.leading, 10)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(accountType == .studio ? "Studio Name" : "Username")
                    .font(.headline)

                Text(studioName)
                    .font(.title)

                if let role = role, !role.isEmpty {
                    Text("Role: \(role)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                if let websiteURL = websiteURL, !websiteURL.isEmpty {
                    Link("Website", destination: URL(string: websiteURL)!)
                        .foregroundColor(.blue)
                        .font(.subheadline)
                        .padding(.top, 5)
                }

                if let socialMediaURL = socialMediaURL, !socialMediaURL.isEmpty {
                    Link("Social Media", destination: URL(string: socialMediaURL)!)
                        .foregroundColor(.blue)
                        .font(.subheadline)
                        .padding(.top, 5)
                }
            }

            Spacer()

            Button(action: {
                // Handle settings or other actions
            }) {
                Image(systemName: "gearshape.2")
                    .font(.title)
                    .foregroundColor(.primary)
            }
            .padding(.trailing, 10)
        }
        .padding(.horizontal)

        HStack(spacing: 20) {
            ProfileStatView(title: "Posts", value: "123")
            ProfileStatView(title: "Followers", value: "456")
            ProfileStatView(title: "Viewers", value: "789")
        }
        .padding(.horizontal)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(accountType: .personal, studioName: "Studio Name", role: "role", websiteURL: "web URL", socialMediaURL: "social URL", interests: ["eating"])
    }
}
