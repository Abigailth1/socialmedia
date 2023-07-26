//
//  UploadPostViewModel.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/26/23.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var coverImage: Image?
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.coverImage = Image(uiImage: uiImage)
    }
    
//    func uploadPost(title: String?, description: String?, characterDescriptions: String?) async throws {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        guard let uiImage = uiImage else { return }
//        
//        let projectRef = Firestore.firestore().collection("projects").document()
//        
//        let project = Project(id: projectRef.documentID, ownerUid: uid, title: title ?? "No title", description: description ?? "No description", characterDescriptions: characterDescriptions ?? "No Character Descriptions", author: "", likes: 0, timestamp: Timestamp())
//        
//        guard let encodedProject = try? Firestore.Encoder().encode(project) else { return }
//        
//        try await projectRef.setData(project)
//    }
    
}
