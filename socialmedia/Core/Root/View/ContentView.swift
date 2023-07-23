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
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegisterViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            }else if let currentUser = viewModel.currentUser {
                //Main View
                MainTabView(user: currentUser)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
