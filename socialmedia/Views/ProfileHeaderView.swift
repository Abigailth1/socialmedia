//
//  ProfileHeaderView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let accountType: AccountType
    
    var body: some View {
        HStack(spacing: 10) {
            Image("profile_picture")
                .resizable()
                .frame(width: 80, height: 80)
                .background(.black)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Alias Name")
                    .font(.headline)
                
                if accountType == .personal {
                    Text("Username")
                        .font(.subheadline)
                } else {
                    Text("Company Name")
                        .font(.subheadline)
                }
            }
            
            Spacer()
            
            Button(action: {
                //handle
            }) {
                Image(systemName: "gearshape.2")
                    .font(.title)
                    .foregroundColor(.primary)
            }
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
        ProfileHeaderView(accountType: .personal)
    }
}
