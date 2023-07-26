//
//  VerificationView2.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct VerificationView2: View {
    let userID: String // Add a property to store the user ID
    
    init(userID: String) {
        self.userID = userID
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Verification Page")
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: HomePageView(user: User.MOCK_USERS[0])) {
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
        VerificationView2(userID: "id")
    }
}
