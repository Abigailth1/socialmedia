//
//  WriterProfileHeaderView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct WriterProfileHeaderView: View {
    var name: String
    var role: String
    var profileImageURL: String?

    var body: some View {
        VStack {
            if let imageURL = profileImageURL, let url = URL(string: imageURL), let imageData = try? Data(contentsOf: url), let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            }

            Text(name)
                .font(.title)
                .padding(.top, 10)

            Text(role)
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
    }
}

struct WriterProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WriterProfileHeaderView(name: "name", role: "role")
    }
}
