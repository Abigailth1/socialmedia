//
//  VerificationView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/15/23.
//

import SwiftUI

struct VerificationView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Welcome to InkGenius, name")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Click here to begin your journey")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            
            Button {
                print("Complete Sign Up")
            } label: {
                Text("Complete")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.vertical)
                    
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
//        NavigationView {
//            VStack {
//                Text("Verification Page")
//                    .font(.title)
//                    .padding()
//
//                NavigationLink(destination: HomePageView()) {
//                    Text("Continue")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(minWidth: 0, maxWidth: .infinity)
//                        .background(Color.black)
//                        .cornerRadius(10)
//                        .padding(.horizontal)
//                }
//                .padding(.top, 30)
//            }
//        }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
