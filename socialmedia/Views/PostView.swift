//
//  PostView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct PostView: View {
    var postText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: "person.circle.fill")
                    .font(.title)
                    .foregroundColor(.blue)
                
                Text("John Doe")
                    .font(.headline)
                
                Spacer()
                
                Text("2h ago")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Text(postText)
            
            HStack(spacing: 20) {
                Button(action: {
                    // Handle like button action
                }) {
                    Image(systemName: "heart")
                        .font(.title)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    // Handle comment button action
                }) {
                    Image(systemName: "message")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Button(action: {
                    // Handle share button action
                }) {
                    Image(systemName: "paperplane")
                        .font(.title)
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}


struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postText: "Post")
    }
}
