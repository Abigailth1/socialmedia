//
//  ProfileStatView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct ProfileStatView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(value)
                .font(.headline)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}


struct ProfileStatView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileStatView(title: "title", value: "value")
    }
}
