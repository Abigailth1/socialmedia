import SwiftUI

struct Comment: Identifiable {
    let id: UUID
    var author: String
    var text: String
}


struct FeedView: View {
    @Binding var feedProjects: [Project]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach($feedProjects) { $project in // Use $ to create a binding from feedProjects
                    VStack(alignment: .leading, spacing: 8) {
                        if let coverImageURL = $project.coverImageURL.wrappedValue {
                            RemoteImage(url: coverImageURL, placeholder: Image(systemName: "book"))
                        } else {
                            Image(systemName: "book")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }

                        HStack {
                            Text(project.title)
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                // Handle like button action
                                project.likes += 1
                            }) {
                                Image(systemName: "heart")
                                Text("\(project.likes)")
                            }
                        }

                        Text(project.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        // Display comments
                        ForEach(project.comments) { comment in
                            VStack(alignment: .leading) {
                                Text("\(comment.author): \(comment.text)")
                                    .font(.body)
                                Divider()
                            }
                        }

                        // Comment section
                        HStack {
                            TextField("Write a comment", text: .constant(""))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Button(action: {
                                // Handle add comment button action
                                let newComment = Comment(id: UUID(), author: "User", text: "Your comment here")
                                project.comments.append(newComment)
                            }) {
                                Text("Post")
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}


struct RemoteImage: View {
    @StateObject private var imageLoader: ImageLoader
    private var placeholder: Image

    init(url: URL?, placeholder: Image = Image(systemName: "book")) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
        self.placeholder = placeholder
    }

    var body: some View {
        if let uiImage = imageLoader.image {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            placeholder
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var url: URL?

    init(url: URL?) {
        self.url = url
        loadImage()
    }

    private func loadImage() {
        guard let url = url else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
