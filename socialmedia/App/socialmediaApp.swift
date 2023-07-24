import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
//        Auth.auth().useEmulator(withHost: "localhost", port: 9099)
//        Auth.auth().useEmulator(withHost: "localhost", port: 8080)
        return true
    }
}

@main
struct socialmediaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView2()
        }
    }
}


//socialmediaApp
