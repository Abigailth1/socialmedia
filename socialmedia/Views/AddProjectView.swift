//
//  AddProjectView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

struct AddProjectView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var isProjectTitleEmpty = false

//    let onAdd: (String, String) -> Void

    var body: some View {
        NavigationView {
            VStack {
                TextField("Project Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Text("Add a brief description:")
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)

                TextEditor(text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Add Project") {
                    if title.isEmpty {
                        isProjectTitleEmpty = true
                    }
//                    else {
//                        onAdd(title, description)
//                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.top, 20)

                Spacer()
            }
            .padding()
            .navigationBarTitle("Add Project", displayMode: .inline)
            .alert(isPresented: $isProjectTitleEmpty) {
                Alert(title: Text("Project Title is Empty"), message: Text("Please enter a title for the project."), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView()
    }
}
