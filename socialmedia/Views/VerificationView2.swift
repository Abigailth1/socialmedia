//
//  VerificationView2.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct VerificationView2: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Verification Page")
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: HomePageView(editedProfile: UserProfile(name: "John Doe", role: "Writer", bio: "Bio goes here", profileImageURL: "profile_image_url", websiteURL: "website_url", socialMediaURL: "social_media_url", interests: ["Writing", "Reading"]))
) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top, 30)
            }
        }
    }
}


struct VerificationView2_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView2()
    }
}
