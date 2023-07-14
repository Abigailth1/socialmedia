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

struct LoginView: View {
    @State private var showCreateAccount = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isCreateAnAccountShown: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var isHomePageShown: Bool = false

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 150, height: 150)
                
                Text("Logo")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding(.top, 50)
            
            Text("Ink Genius")
                .font(.headline)
                .padding(.bottom, 50)
            
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.horizontal, 50)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.horizontal, 50)
            
            Button(action: {
                isHomePageShown = true
            }) {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.top, 5)
            }
        }
        .fullScreenCover(isPresented: $isHomePageShown) {
            HomePageView()
        }
        
        Divider()
            .padding(.vertical, 20)
        
        HStack {
            Button(action: {
                // handle google login
                print("Google button tapped")
            }) {
                Image("google_logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            
            Button(action: {
                // handle facebook login
                print("Facebook button tapped")
            }) {
                Image("facebook_logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            
            Button(action: {
                // handle pinterest login
                print("Pinterest button tapped")
            }) {
                Image("pinterest_logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
        
        Button(action: {
            isCreateAnAccountShown = true
        }) {
            Text("Create An Account")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 200, height: 50)
                .background(Color.black)
                .cornerRadius(10)
        }
        .fullScreenCover(isPresented: $isCreateAnAccountShown) {
            CreateAccountView()
        }
    }
}

struct CreateAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var profileImage: Image? = nil
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTermsAccepted: Bool = false
    @State private var accountType: AccountType = .personal
    @State private var companyName: String = ""
    @State private var phoneNumber: String = ""
    @State private var alias: String = ""
    @State private var isVerificationCodeShown: Bool = false
    @State private var isRegistered: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                }
                .padding(.top, 10)
                
                Spacer()
            }
            Group {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .padding(.bottom, 10)
                        .background(Color.black)
                } else {
                    Button(action: {
                        print("Select profile picture tapped")
                    }) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 10)
                }
                
                Text("Create An Account")
                    .font(.title)
                    .padding(.bottom, 10)
                
                Picker("Account Type", selection: $accountType) {
                    Text("Personal").tag(AccountType.personal)
                    Text("Business").tag(AccountType.business)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                if accountType == .business {
                    TextField("Company Name", text: $companyName)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)
                } else {
                    TextField("Alias", text: $alias)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)
                }
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                TextField("Phone Number", text: $phoneNumber)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
            }
            
            Group {
                Toggle("I agree to the Terms and Conditions", isOn: $isTermsAccepted)
                    .padding(.horizontal, 40)
                
                Button(action: {
                    registerUser()
                }) {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top, 30)
            }
        }
        .fullScreenCover(isPresented: $isVerificationCodeShown) {
            VerificationView()
        }
    }
    
    private func registerUser() {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                print("Registration error: \(error.localizedDescription)")
            } else {
                print("User registered successfully!")
                isRegistered = true
                saveUserData()
                isVerificationCodeShown = true
            }
        }
    }
    
    private func saveUserData() {
        let db = Firestore.firestore()
        let userDocument = db.collection("users").document(email)
        
        var accountTypeString: String = ""
        switch accountType {
        case .personal:
            accountTypeString = AccountType.personal.rawValue
        case .business:
            accountTypeString = AccountType.business.rawValue
        }
        
        let userData: [String: Any] = [
            "username": username,
            "email": email,
            "accountType": accountTypeString,
            "companyName": companyName,
            "alias": alias,
            "phoneNumber": phoneNumber
        ]
        
        userDocument.setData(userData) { error in
            if let error = error {
                print("Error saving user data: \(error.localizedDescription)")
            } else {
                print("User data saved successfully!")
            }
        }
    }
}

struct VerificationView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Verification Page")
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: HomePageView()) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top, 30)
            }
        }
    }
}

struct HomePageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab : Tab = .feed
    @State private var bottomSafeAreaInset: CGFloat = 0
    @State private var accountType: AccountType = . personal
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            if accountType == .personal {
                PersonalFeedView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Feed")
                    }
                    .tag(Tab.feed)
            } else {
                BusinessFeedView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Feed")
                    }
                    .tag(Tab.feed)
            }
            
            ExploreView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                .tag(Tab.explore)
            
            NotificationsView()
                .tabItem{
                    Image(systemName: "shareplay")
                    Text("AI")
                }
                .tag(Tab.notifications)
            
            MessagesView()
                .tabItem {
                    Image(systemName: "book")
                    Text("World")
                }
                .tag(Tab.messages)
            
            if accountType == .personal {
                PersonalProfileView()
                    .tabItem{
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(Tab.profile)
            } else {
                BusinessProfileView()
                    .tabItem {
                        Image(systemName: "business")
                        Text("Profile")
                    }
                    .tag(Tab.profile)
            }
        }
        .accentColor(.primary)
        .navigationBarHidden(true)
        .overlay(
            HStack(spacing: 0) {
                Spacer()
                
                Button(action: {
                    selectedTab = .messages
                }) {
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(9)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(.bottom, bottomSafeAreaInset)
                .offset(x: -5, y: 250)
            }
                .onAppear{
                    updateBottomSafeAreaInset()
                }
                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                    updateBottomSafeAreaInset()
                }
        )
    }
    
    private func updateBottomSafeAreaInset() {
        guard let keyWindow = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow }) else {
            return
        }
        bottomSafeAreaInset = keyWindow.safeAreaInsets.bottom
    }
}

struct PersonalFeedView: View {
    var body: some View {
        VStack {
            
        }
    }
}

struct BusinessFeedView: View {
    var body: some View {
        Text("Business")
    }
}

struct ProfileHeaderView: View {
    let accountType: AccountType
    
    var body: some View {
        HStack(spacing: 10) {
            Image("profile_picture")
                .resizable()
                .frame(width: 80, height: 80)
                .background(.black)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Alias Name")
                    .font(.headline)
                
                if accountType == .personal {
                    Text("Username")
                        .font(.subheadline)
                } else {
                    Text("Company Name")
                        .font(.subheadline)
                }
            }
            
            Spacer()
            
            Button(action: {
                //handle
            }) {
                Image(systemName: "gearshape.2")
                    .font(.title)
                    .foregroundColor(.primary)
            }
        }
        .padding(.horizontal)
        
        HStack(spacing: 20) {
            ProfileStatView(title: "Posts", value: "123")
            ProfileStatView(title: "Followers", value: "456")
            ProfileStatView(title: "Viewers", value: "789")
        }
        .padding(.horizontal)
    }
}

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

struct BusinessProfileView: View {
    var body: some View {
        Text("Business Feed View")
    }
}

struct PersonalProfileView: View {
    var body: some View {
        Text("Personal Feed View")
            .font(.title)
            .padding()
    }
}
        
struct leftSwipeView: View {
    @State private var selectedTab: LeftSwipe = .originals
    
    var body: some View {
        TabView(selection: $selectedTab) {
            OriginalsView()
                .tabItem {
                    Label("Originals", systemImage: "heart")
                }
                .tag(LeftSwipe.originals)
            
            DailyView()
                .tabItem {
                    Label("Daily", systemImage: "sun.max")
                }
                .tag(LeftSwipe.daily)
            
            GenresView()
                .tabItem {
                    Label("Genres", systemImage: "text.book.closed")
                }
                .tag(LeftSwipe.genres)
        }
        .accentColor(.primary)
    }
}

struct FeedView: View {
    var body: some View {
        Text("Feed View")
            .font(.title)
            .padding()
    }
}

struct ExploreView: View {
    var body: some View {
        Text("Explore View")
            .font(.title)
            .padding()
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Notification View")
            .font(.title)
            .padding()
    }
}

struct MessagesView: View {
    var body: some View {
        Text("Message View")
            .font(.title)
            .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
            .font(.title)
            .padding()
    }
}

struct AIView: View {
    var body: some View {
        Text("AI View")
            .font(.title)
            .padding()
    }
}

struct WorldView: View {
    var body: some View {
        Text("AI View")
            .font(.title)
            .padding()
    }
}

struct OriginalsView: View {
    var body: some View {
        Text("Originals View")
            .font(.title)
            .padding()
    }
}

struct DailyView: View {
    var body: some View {
        Text("Originals View")
            .font(.title)
            .padding()
    }
}

struct GenresView: View {
    var body: some View {
        Text("Originals View")
            .font(.title)
            .padding()
    }
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
