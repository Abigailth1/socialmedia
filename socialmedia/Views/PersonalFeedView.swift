//
//  PersonalFeedView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI

struct PersonalFeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(1...10, id: \.self) { index in
                    PostView(postText: "Post \(index)")
                }
            }
            .padding()
        }
    }
}


struct PersonalFeedView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalFeedView()
    }
}
