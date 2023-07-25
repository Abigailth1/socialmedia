import SwiftUI
import Firebase
import FirebaseCore
import Foundation
import Combine

enum AccountType: String {
    case personal
    case studio
}

struct Employee: Identifiable {
    let id: UUID = UUID()
    let name: String
    let role: String
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

struct UserProfile {
    var id: String // Change 'Binding<String>' to 'String'
    var name: String
    var role: String
    var bio: String?
    var profileImageURL: String?
    var websiteURL: String?
    var socialMediaURL: String?
    var interests: [String]
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

class ProjectDetailsViewModel: ObservableObject {
    @Published var project: Project

    init(project: Project) {
        self.project = project
    }

    func updateProject(_ project: Project) {
        self.project = project
    }
}



struct LoginView: View {
    @State private var showCreateAccount = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isCreateAnAccountShown: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var isHomePageShown: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Image("instagram_logo") // Replace with your Instagram logo image
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 50)
                .padding(.top, 100)

            TextField("Phone number, username, or email", text: $username)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .cornerRadius(5)

            SecureField("Password", text: $password)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .cornerRadius(5)

            Button(action: {
                isHomePageShown = true
            }) {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue) // Blue color similar to Instagram
                    .cornerRadius(5)
            }

            Text("OR")
                .foregroundColor(Color(.systemGray))
                .padding(.vertical, 5)

            HStack(spacing: 20) {
                Button(action: {
                    // handle google login
                    print("Google button tapped")
                }) {
                    Image("google_logo") // Replace with your Google logo image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                }

                Button(action: {
                    // handle facebook login
                    print("Facebook button tapped")
                }) {
                    Image("facebook_logo") // Replace with your Facebook logo image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                }

                Button(action: {
                    // handle pinterest login
                    print("Pinterest button tapped")
                }) {
                    Image("pinterest_logo") // Replace with your Pinterest logo image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                }
            }

            Button(action: {
                isCreateAnAccountShown = true
            }) {
                Text("Create New Account")
                    .font(.headline)
                    .foregroundColor(.purple) // Purple color similar to Instagram
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
            }
            .fullScreenCover(isPresented: $isCreateAnAccountShown) {
                CreateAccountView()
            }

            Spacer()
        }
        .padding(.horizontal, 30)
        .background(Color(red: 0.94, green: 0.94, blue: 0.96)) // Light gray background color
        .edgesIgnoringSafeArea(.all) // Ignore safe area to extend the background color
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
    @State private var websiteURL: String = ""
    @State private var socialMediaURL: String = ""
    @State private var alias: String = ""
    @State private var phoneNumber: String = ""
    @State private var isVerificationCodeShown: Bool = false
    @State private var isRegistered: Bool = false
    @State private var userProfile: UserProfile = UserProfile(id: "", name: "", role: "", bio: "", profileImageURL: "", websiteURL: "", socialMediaURL: "", interests: [])
    @State private var newInterest: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Group {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .padding(.bottom, 10)
                            .frame(width: 120, height: 120)
                    } else {
                        Button(action: {
                            print("Select profile picture tapped")
                        }) {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 100))
                                .foregroundColor(accountType == .personal ? .blue : .purple) // Personal is blue, Studio is purple
                        }
                        .padding(.bottom, 10)
                        .frame(width: 120, height: 120)
                        .background(accountType == .personal ? Color.blue : Color.purple) // Personal is blue, Studio is purple
                        .clipShape(Circle())
                    }

                    Text("Create An Account")
                        .font(.title)
                        .padding(.bottom, 10)

                    Picker("Account Type", selection: $accountType) {
                        Text("Personal").tag(AccountType.personal)
                        Text("Studio").tag(AccountType.studio)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 50)
                    .padding(.bottom, 20)

                    if accountType == .studio {
                        TextField("Studio Name", text: $companyName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal, 10)

                        TextField("Website URL", text: $websiteURL)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal, 10)

                        TextField("Social Media URL", text: $socialMediaURL)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal, 10)
                    } else {
                        TextField("Username", text: $username)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal, 10)

                        TextField("Alias", text: $alias)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal, 10)
                    }

                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)

                    TextField("Phone Number", text: $phoneNumber)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)

                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color(.systemGray6))
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
                            .foregroundColor(.white) // Set the color to white
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(accountType == .personal ? Color.blue : Color.purple) // Set the background color to blue
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.top, 30)
                    .disabled(!isTermsAccepted) // Disable the button if terms are not accepted

                    List {
                        ForEach(userProfile.interests, id: \.self) { interest in
                            Text(interest)
                        }
                        .onDelete(perform: deleteInterest)
                    }
                    .listStyle(PlainListStyle())

                    TextField("Add Interest", text: $newInterest)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal, 10)

                    Button(action: addInterest) {
                        Text("Add")
                            .foregroundColor(.blue)
                    }
                    .padding(.bottom)
                }
            }
            .padding() // Add overall padding
        }
        .fullScreenCover(isPresented: $isVerificationCodeShown) {
            VerificationView(userID: userProfile.id) // Pass the user ID here
        }
    }

    private func registerUser() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Registration error: \(error.localizedDescription)")
            } else {
                if let authResult = authResult {
                    print("User registered successfully!")
                    isRegistered = true
                    userProfile.id = authResult.user.uid // Set the user ID after successful registration
                    saveUserProfileData()
                }
            }
        }
    }

    private func saveUserProfileData() {
        let db = Firestore.firestore()
        let userDocument = db.collection("users").document(email)

        let userData: [String: Any] = [
                    // Existing code...
                    "name": userProfile.name,
                    "role": userProfile.role,
                    "bio": userProfile.bio ?? "", // Add a default value for bio
                    "profileImageURL": userProfile.profileImageURL ?? "", // Add a default value for profileImageURL
                    "websiteURL": userProfile.websiteURL ?? "", // Add a default value for websiteURL
                    "socialMediaURL": userProfile.socialMediaURL ?? "", // Add a default value for socialMediaURL
                    "interests": userProfile.interests,
                ]
        userDocument.setData(userData) { error in
            if let error = error {
                print("Error saving user data: \(error.localizedDescription)")
            } else {
                print("User data saved successfully!")
            }
        }
    }

    private func addInterest() {
        if !newInterest.isEmpty {
            userProfile.interests.append(newInterest)
            newInterest = ""
        }
    }

    private func deleteInterest(at offsets: IndexSet) {
        userProfile.interests.remove(atOffsets: offsets)
    }
}

struct VerificationView: View {
    let userID: String // Add a property to store the user ID
    
    init(userID: String) {
        self.userID = userID
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Verification Page")
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: HomePageView(editedProfile: UserProfile(id: userID, name: "John Doe", role: "Writer", bio: "Bio goes here", profileImageURL: "profile_image_url", websiteURL: "website_url", socialMediaURL: "social_media_url", interests: ["Writing", "Reading"]))) {
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
    @State private var selectedTab: Tab = .feed
    @State private var bottomSafeAreaInset: CGFloat = 0
    @State private var accountType: AccountType = .personal

    @State private var projects: [Project] = [
        Project(id: UUID(), title: "Hello World", description: "Description of Project 1", characterDescriptions: "Character Des 1", isPublished: false, coverImageURL: URL(string: "https://example.com/book1.jpg"), author: "Author 1"),
        Project(id: UUID(), title: "Project 2", description: "Description of Project 2", characterDescriptions: "Character Des 2", isPublished: false, coverImageURL: URL(string: "https://example.com/book2.jpg"), author: "Author 2"),
        Project(id: UUID(), title: "Project 3", description: "Description of Project 3", characterDescriptions: "Character Des 3", isPublished: false, coverImageURL: URL(string: "https://example.com/book3.jpg"), author: "Author 3"),
    ]



    @State private var yourProjectsArray: [Project] = []
    @State private var editedProfile: UserProfile

    @State private var publishedProjects: [Project] = []

    public init(editedProfile: UserProfile) {
        self._editedProfile = State(initialValue: editedProfile)
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            if accountType == .personal {
                FeedView(feedProjects: $projects)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Feed")
                    }
                    .tag(Tab.feed)
            } else {
                BusinessFeedView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Feed")
                    }
                    .tag(Tab.feed)
            }

            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                .tag(Tab.explore)

            AIView()
                .tabItem {
                    Image(systemName: "shareplay")
                    Text("AI")
                }
                .tag(Tab.ai)

            WorldView(projects: $projects)
                .tabItem {
                    Image(systemName: "book")
                    Text("World")
                }
                .tag(Tab.world)

            if accountType == .personal {
                PersonalProfileView(userProfile: editedProfile, projects: projects)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(Tab.profile)
            } else {
                ProductionStudioProfileView(userProfile: editedProfile)
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
            .onAppear {
                updateBottomSafeAreaInset()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                updateBottomSafeAreaInset()
            }
        )
    }

    private func updateBottomSafeAreaInset() {
        guard let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
            return
        }
        bottomSafeAreaInset = keyWindow.safeAreaInsets.bottom
    }
}



//Project
struct Project: Identifiable {
    let id: UUID
    var title: String
    var description: String
    var characterDescriptions: String
    var isPublished: Bool
    var coverImageURL: URL?
    var author: String
    var likes: Int
    var comments: [Comment] // Add the 'comments' property

    // Add any other properties and methods as needed

    // Provide a custom initializer if needed
    init(id: UUID = UUID(), title: String, description: String, characterDescriptions: String, isPublished: Bool, coverImageURL: URL?, author: String, likes: Int = 0, comments: [Comment] = []) { // Add default values for 'likes' and 'comments'
        self.id = id
        self.title = title
        self.description = description
        self.characterDescriptions = characterDescriptions
        self.isPublished = isPublished
        self.coverImageURL = coverImageURL
        self.author = author
        self.likes = likes
        self.comments = comments // Initialize 'comments' with the provided value or an empty array
    }
}

struct PersonalFeedView: View {
    @Binding var publishedProjects: [Project]
    @Binding var yourProjectsArray: [Project]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(publishedProjects) { project in
                    PublishedProjectView(project: project)
                }
                ForEach(yourProjectsArray) { project in
                    YourProjectView(project: project)
                }
            }
            .padding()
        }
    }
}

// Assuming PublishedProjectView and YourProjectView are custom views
// Replace these with your actual views for displaying the project details.

struct PublishedProjectView: View {
    var project: Project

    var body: some View {
        // Custom view for displaying published project details
        VStack {
            Text(project.title)
            // Add other project details as needed
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(10)
    }
}

struct YourProjectView: View {
    var project: Project

    var body: some View {
        // Custom view for displaying your project details
        VStack {
            Text(project.title)
            // Add other project details as needed
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
    }
}


struct BusinessFeedView: View {
    var body: some View {
        VStack {
            Text("Business Feed View")
                .font(.title)
                .padding()
        }
    }
}


struct ProfileHeaderView: View {
    let accountType: AccountType
    let studioName: String
    let role: String?
    let websiteURL: String?
    let socialMediaURL: String?
    let interests: [String]

    var body: some View {
        VStack(spacing: 10) {
            if accountType == .studio {
                Image(systemName: "film")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.leading, 10)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(accountType == .studio ? "Studio Name" : "Username")
                    .font(.headline)

                Text(studioName)
                    .font(.title)

                if let role = role, !role.isEmpty {
                    Text("Role: \(role)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                if let websiteURL = websiteURL, !websiteURL.isEmpty {
                    Link("Website", destination: URL(string: websiteURL)!)
                        .foregroundColor(.blue)
                        .font(.subheadline)
                        .padding(.top, 5)
                }

                if let socialMediaURL = socialMediaURL, !socialMediaURL.isEmpty {
                    Link("Social Media", destination: URL(string: socialMediaURL)!)
                        .foregroundColor(.blue)
                        .font(.subheadline)
                        .padding(.top, 5)
                }
            }

            Spacer()

            Button(action: {
                // Handle settings or other actions
            }) {
                Image(systemName: "gearshape.2")
                    .font(.title)
                    .foregroundColor(.primary)
            }
            .padding(.trailing, 10)
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


struct ProductionStudioProfileHeaderView: View {
    let studioName: String
    let role: String?
    let websiteURL: String?
    let socialMediaURL: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(studioName)
                .font(.title)
                .foregroundColor(.black)

            if let role = role {
                Text("Role: \(role)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            if let websiteURL = websiteURL {
                Link(destination: URL(string: websiteURL)!) {
                    HStack {
                        Image(systemName: "globe")
                        Text("Website")
                    }
                }
            }

            if let socialMediaURL = socialMediaURL {
                Link(destination: URL(string: socialMediaURL)!) {
                    HStack {
                        Image(systemName: "link")
                        Text("Social Media")
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ProductionStudioProfileView: View {
    let userProfile: UserProfile
    @State private var employees: [Employee] = []
    @State private var newEmployeeName: String = ""
    @State private var newEmployeeRole: String = ""

    var body: some View {
        VStack {
            ProfileHeaderView(accountType: .studio, studioName: userProfile.name, role: userProfile.role, websiteURL: userProfile.websiteURL ?? "", socialMediaURL: userProfile.socialMediaURL ?? "", interests: userProfile.interests)

            List(employees, id: \.id) { employee in
                EmployeeRowView(employee: employee)
            }

            HStack {
                TextField("Employee Name", text: $newEmployeeName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)

                TextField("Role", text: $newEmployeeRole)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 10)

                Button(action: addEmployee) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 25))
                }
            }
            .padding(.horizontal)
        }
    }

    private func addEmployee() {
        guard !newEmployeeName.isEmpty, !newEmployeeRole.isEmpty else {
            return
        }

        let newEmployee = Employee(name: newEmployeeName, role: newEmployeeRole)
        employees.append(newEmployee)

        newEmployeeName = ""
        newEmployeeRole = ""
    }
}

struct EmployeeRowView: View {
    let employee: Employee

    var body: some View {
        HStack {
            Text(employee.name)
            Spacer()
            Text(employee.role)
        }
        .padding()
    }
}

struct PersonalProfileView: View {
    @State private var isEditingProfile = false
    @State private var editedProfile: UserProfile
    var projects: [Project] // Add this line to accept projects array

    init(userProfile: UserProfile, projects: [Project]) { // Modify the init to accept projects
        self._editedProfile = State(initialValue: userProfile)
        self.projects = projects // Initialize the projects array
    }

    var body: some View {
        VStack {
            if isEditingProfile {
                EditProfileView(editedProfile: $editedProfile, isEditing: $isEditingProfile)
            } else {
                WriterProfileHeaderView(name: editedProfile.name, role: editedProfile.role, profileImageURL: editedProfile.profileImageURL)

                // Display other profile information here

                List {
                    Section(header: Text("Projects")) {
                        ForEach(projects) { project in
                            Button(action: {
                                navigateToProjectDetails(project: project)
                            }) {
                                Text(project.title)
                            }
                        }
                    }

                    Section(header: Text("Interests")) {
                        ForEach(editedProfile.interests, id: \.self) { interest in
                            Text(interest)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Profile", displayMode: .inline)

                Button(action: {
                    isEditingProfile = true
                }) {
                    Text("Edit Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .padding(.horizontal)
                }
            }
        }
        .padding()
    }

    private func navigateToProjectDetails(project: Project) {
        // Navigate to a new view displaying project details (e.g., ProjectDetailsView)
        // You can pass the selected project to the next view if needed
        // For example: NavigationLink(destination: ProjectDetailsView(project: project)) { ... }
    }
}

struct WriterProfileHeaderView: View {
    var name: String
    var role: String
    var profileImageURL: String?

    var body: some View {
        VStack {
            if let imageURL = profileImageURL, let url = URL(string: imageURL), let imageData = try? Data(contentsOf: url), let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            }

            Text(name)
                .font(.title)
                .padding(.top, 10)

            Text(role)
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
    }
}

struct EditProfileView: View {
    @Binding var editedProfile: UserProfile
    @Binding var isEditing: Bool

    var body: some View {
        VStack {
            // Add UI elements to edit the profile information, for example:
            TextField("Name", text: $editedProfile.name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.horizontal, 10)

            TextField("Role", text: $editedProfile.role)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.horizontal, 10)

            // Add more fields for editing other profile information

            Button(action: {
                // Save the changes and exit editing mode
                isEditing = false
            }) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}

class WorldViewModel: ObservableObject {
    @Published var projects: [Project]

    init(projects: [Project]) {
        self.projects = projects
    }
}


struct ExploreView: View {
    var body: some View {
        VStack {
            Text("Explore View")
                .font(.title)
                .padding()
            
            // Add your explore content here
        }
    }
}

struct NotificationsView: View {
    var body: some View {
        VStack {
            Text("Notifications View")
                .font(.title)
                .padding()
        }
    }
}

struct MessagesView: View {
    var body: some View {
        VStack {
            Text("Message View")
                .font(.title)
                .padding()
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile View")
                .font(.title)
                .padding()
        }
    }
}

struct ContentView: View {
    @State private var yourProjectsArray: [Project] = []
    let userID: String // Add a property to store the user ID

    var body: some View {
        NavigationView {
            HomePageView(editedProfile: UserProfile(id: userID, name: "John Doe", role: "Writer", bio: "Bio goes here", profileImageURL: "profile_image_url", websiteURL: "website_url", socialMediaURL: "social_media_url", interests: ["Writing", "Reading"]))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let userID: String = "your_user_id" // Add a property to store the user ID

    static var previews: some View {
        HomePageView(editedProfile: UserProfile(id: userID, name: "John Doe", role: "Writer", bio: "Bio goes here", profileImageURL: "profile_image_url", websiteURL: "website_url", socialMediaURL: "social_media_url", interests: ["Writing", "Reading"]))
    }
}


//Add AI
