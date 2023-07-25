import Foundation
import SwiftUI

struct Message: Identifiable {
    let id: UUID
    let content: String
    let author: String
    let timestamp: Date
}

struct MessageView: View {
    @State private var messages: [Message] = [
        Message(id: UUID(), content: "Hello, everyone!", author: "John", timestamp: Date()),
        Message(id: UUID(), content: "Welcome to the messaging board.", author: "Alice", timestamp: Date().addingTimeInterval(-3600)),
        Message(id: UUID(), content: "This is a sample message.", author: "Bob", timestamp: Date().addingTimeInterval(-7200)),
        // Add more messages here
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(messages) { message in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(message.author)
                            .font(.headline)
                        Text(message.content)
                            .font(.body)
                        Text(formatDate(message.timestamp))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Messaging Board")
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
