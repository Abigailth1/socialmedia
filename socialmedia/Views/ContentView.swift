import SwiftUI
import Firebase

enum AccountType: String {
    case personal
    case business
}

enum Tab {
    case feed
    case explore
    case notifications
    case world
    case messages
    case profile
    case ai
}

enum LeftSwipe {
    case originals
    case daily
    case genres
}

struct ContentView: View {
    var body: some View {
        LoginView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
