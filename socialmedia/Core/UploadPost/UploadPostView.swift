//
//  UploadPostView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/26/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @Binding var showUploadView: Bool
    @StateObject var viewModel = UploadPostViewModel()
    var body: some View {
        VStack {
            //action
            HStack {
                Button {
                    showUploadView = false
                } label: {
                    Text("Cancel")
                }
                
                Text("New Project")
                    .fontWeight(.semibold)
                
                Button {
                    print("upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }


            }
            .padding()
            
            
            // post image and caption
            HStack(spacing: 10) {
                
                if let image = viewModel.coverImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                } else {
                    Image(systemName: "book.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter you description...", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(showUploadView: .constant(true))
    }
}
