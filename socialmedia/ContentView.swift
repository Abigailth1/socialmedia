import SwiftUI
import Firebase
import FirebaseCore

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

enum navItems {
    case universe
    case world
    case scene
    case character
    case language
    case quest
    case religion
    case calendar
    case brainstorm
    case home
}

struct Folder: Identifiable {
    let id = UUID()
    let name: String
}

struct Universe: Identifiable {
    let id = UUID()
    let name: String
}

struct CityWorld: Identifiable {
    let id = UUID()
    let name: String
}

struct CharacterSpecies: Identifiable {
    let id = UUID()
    let name: String
}

struct LanguageConstruction: Identifiable {
    let id = UUID()
    let name: String
}

struct QuestBuilder: Identifiable {
    let id = UUID()
    let name: String
}

struct ReligionCulture: Identifiable {
    let id = UUID()
    let name: String
}

struct CalendarModel: Identifiable {
    let id = UUID()
    let name: String
}

struct Note: Identifiable {
    let id = UUID()
    let name: String
}

struct TeamMember: Identifiable {
    let id = UUID()
    let name: String
    let profileImageName: String
}

struct User {
    let name: String
    let profileImageName: String
    let followers: Int
    let following: Int
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

class ContentViewModel: ObservableObject {
    @Published var user: User
    @Published var folders: [Folder]
    @Published var universes: [Universe]
    @Published var cityWorlds: [CityWorld]
    @Published var characterSpecies: [CharacterSpecies]
    @Published var languageConstructions: [LanguageConstruction]
    @Published var questBuilders: [QuestBuilder]
    @Published var religionCultures: [ReligionCulture]
    @Published var calendars: [CalendarModel]
    @Published var notes: [Note]
    @Published var teamMembers: [TeamMember]
    @Published var planets: [Planet]

    
    init() {
        user = User(name: "John Doe", profileImageName: "profile", followers: 100, following: 50)
        
        folders = [
            Folder(name: "Folder 1"),
            Folder(name: "Folder 2"),
            Folder(name: "Folder 3")
        ]
        
        planets = [
                    Planet(name: "Planet 1"),
                    Planet(name: "Planet 2"),
                    Planet(name: "Planet 3")
                ]
        
        universes = [
            Universe(name: "Universe 1"),
            Universe(name: "Universe 2"),
            Universe(name: "Universe 3")
        ]
        
        cityWorlds = [
            CityWorld(name: "City World 1"),
            CityWorld(name: "City World 2"),
            CityWorld(name: "City World 3")
        ]
        
        characterSpecies = [
            CharacterSpecies(name: "Species 1"),
            CharacterSpecies(name: "Species 2"),
            CharacterSpecies(name: "Species 3")
        ]
        
        languageConstructions = [
            LanguageConstruction(name: "Language 1"),
            LanguageConstruction(name: "Language 2"),
            LanguageConstruction(name: "Language 3")
        ]
        
        questBuilders = [
            QuestBuilder(name: "Quest Builder 1"),
            QuestBuilder(name: "Quest Builder 2"),
            QuestBuilder(name: "Quest Builder 3")
        ]
        
        religionCultures = [
            ReligionCulture(name: "Religion Culture 1"),
            ReligionCulture(name: "Religion Culture 2"),
            ReligionCulture(name: "Religion Culture 3")
        ]
        
        calendars = [
            CalendarModel(name: "Calendar 1"),
            CalendarModel(name: "Calendar 2"),
            CalendarModel(name: "Calendar 3")
        ]
        
        notes = [
            Note(name: "Note 1"),
            Note(name: "Note 2"),
            Note(name: "Note 3")
        ]
        
        teamMembers = [
            TeamMember(name: "Member 1", profileImageName: "member1"),
            TeamMember(name: "Member 2", profileImageName: "member2"),
            TeamMember(name: "Member 3", profileImageName: "member3"),
            TeamMember(name: "Member 4", profileImageName: "member4"),
            TeamMember(name: "Member 5", profileImageName: "member5")
        ]
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
            
            WorldView()
                .tabItem {
                    Image(systemName: "book")
                    Text("World")
                }
                .tag(Tab.world)
            
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

import SwiftUI

struct Planet: Identifiable {
    let id = UUID()
    let name: String
}

struct CityWorld: Identifiable {
    let id = UUID()
    let name: String
}

struct Folder: Identifiable {
    let id = UUID()
    let name: String
}

struct LanguageConstruction: Identifiable {
    let id = UUID()
    let name: String
}

struct Species: Identifiable {
    let id = UUID()
    let name: String
}

struct QuestBuilder: Identifiable {
    let id = UUID()
    let name: String
}

struct ReligionCulture: Identifiable {
    let id = UUID()
    let name: String
}

struct FantasyCalendar: Identifiable {
    let id = UUID()
    let name: String
}

struct BrainstormNote: Identifiable {
    let id = UUID()
    let name: String
}

struct User {
    let name: String
    let profileImageName: String
    let followers: Int
    let following: Int
    let posts: Int
}

class ContentViewModel: ObservableObject {
    @Published var user: User
    @Published var planets: [Planet]
    @Published var folders: [Folder]
    @Published var cityWorlds: [CityWorld]
    @Published var characterSpecies: [Species]
    @Published var languageConstructions: [LanguageConstruction]
    @Published var questBuilders: [QuestBuilder]
    @Published var religionCultures: [ReligionCulture]
    @Published var fantasyCalendars: [FantasyCalendar]
    @Published var brainstormNotes: [BrainstormNote]
    
    init() {
        user = User(name: "John Doe", profileImageName: "profile", followers: 100, following: 50, posts: 3)
        folders = []
        planets = []
        cityWorlds = []
        characterSpecies = []
        languageConstructions = []
        questBuilders = []
        religionCultures = []
        fantasyCalendars = []
        brainstormNotes = []
    }
}

struct WorldView: View {
    @ObservedObject var viewModel = ContentViewModel()
    @State private var isAddingFolder = false
    @State private var isAddingPlanet = false
    @State private var isAddingCityWorld = false
    @State private var isAddingCharacterSpecies = false
    @State private var isAddingLanguageConstruction = false
    @State private var isAddingQuestBuilder = false
    @State private var isAddingReligionCulture = false
    @State private var isAddingCalendar = false
    @State private var isAddingNote = false
    @State private var newFolderName = ""
    @State private var newPlanetName = ""
    @State private var newCityWorldName = ""
    @State private var newCharacterSpeciesName = ""
    @State private var newLanguageConstructionName = ""
    @State private var newQuestBuilderName = ""
    @State private var newReligionCultureName = ""
    @State private var newFantasyCalendarName = ""
    @State private var newBrainstormNote = ""
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Section(header: Text("Profile")) {
                        userProfileView(user: viewModel.user)
                    }
                    
                    Section(header: Text("Folders")) {
                        ForEach(viewModel.folders.sorted(by: { $0.name < $1.name })) { folder in
                            NavigationLink(destination: FolderDetailView(folder: folder)) {
                                HStack {
                                    Image(systemName: "folder")
                                    Text(folder.name)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.folders.remove(atOffsets: indexSet)
                        }
                    }
                    
                    Section(header: Text("Files")) {
                        ForEach(viewModel.planets.sorted(by: { $0.name < $1.name })) { planet in
                            NavigationLink(destination: PlanetDetailView(planet: planet)) {
                                HStack {
                                    Image(systemName: "globe")
                                    Text(planet.name)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.planets.remove(atOffsets: indexSet)
                        }
                        
                        ForEach(viewModel.cityWorlds.sorted(by: { $0.name < $1.name })) { cityWorld in
                            NavigationLink(destination: CityDetailView(cityWorld: cityWorld)) {
                                HStack {
                                    Image(systemName: "building.2")
                                    Text(cityWorld.name)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.cityWorlds.remove(atOffsets: indexSet)
                        }
                        
                        ForEach(viewModel.characterSpecies.sorted(by: { $0.name < $1.name })) { species in
                            NavigationLink(destination: CharacterSpeciesDetailView(species: species)) {
                                HStack {
                                    Image(systemName: "person")
                                    Text(species.name)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.characterSpecies.remove(atOffsets: indexSet)
                        }
                        
                        ForEach(viewModel.languageConstructions.sorted(by: { $0.name < $1.name })) { languageConstruction in
                            NavigationLink(destination: LanguageConstructionDetailView(languageConstruction: languageConstruction)) {
                                HStack {
                                    Image(systemName: "scribble")
                                    Text(languageConstruction.name)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.languageConstructions.remove(atOffsets: indexSet)
                        }
                        
                        ForEach(viewModel.questBuilders.sorted(by: { $0.name < $1.name })) { questBuilder in
                            NavigationLink(destination: QuestBuilderDetailView(questBuilder: questBuilder)) {
                                HStack {
                                    Image(systemName: "scroll")
                                    Text(questBuilder.name)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.questBuilders.remove(atOffsets: indexSet)
                        }
                        
                        ForEach(viewModel.religionCultures.sorted(by: { $0.name < $1.name })) { religionCulture in
                            NavigationLink(destination: ReligionCultureDetailView(religionCulture: religionCulture)) {
                                HStack {
                                    Image(systemName: "cross")
                                    Text(religionCulture.name)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.religionCultures.remove(atOffsets: indexSet)
                        }
                        
                        ForEach(viewModel.fantasyCalendars.sorted(by: { $0.name < $1.name })) { fantasyCalendar in
                            NavigationLink(destination: FantasyCalendarDetailView(fantasyCalendar: fantasyCalendar)) {
                                HStack {
                                    Image(systemName: "calendar")
                                    Text(fantasyCalendar.name)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.fantasyCalendars.remove(atOffsets: indexSet)
                        }
                        
                        ForEach(viewModel.brainstormNotes.sorted(by: { $0.name < $1.name })) { brainstormNote in
                            NavigationLink(destination: BrainstormNoteDetailView(brainstormNote: brainstormNote)) {
                                HStack {
                                    Image(systemName: "brain")
                                    Text(brainstormNote.name)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.brainstormNotes.remove(atOffsets: indexSet)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Writer's Hub")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button(action: {
                                isAddingFolder = true
                            }) {
                                Label("Add Universe", systemImage: "moon.stars")
                            }
                            Button(action: {
                                isAddingPlanet = true
                            }) {
                                Label("Add Planet", systemImage: "globe")
                            }
                            Button(action: {
                                isAddingCityWorld = true
                            }) {
                                Label("Add CityWorld", systemImage: "building.2")
                            }
                            Button(action: {
                                isAddingCharacterSpecies = true
                            }) {
                                Label("Add Character Species", systemImage: "person")
                            }
                            Button(action: {
                                isAddingLanguageConstruction = true
                            }) {
                                Label("Add Language Construction", systemImage: "scribble")
                            }
                            Button(action: {
                                isAddingQuestBuilder = true
                            }) {
                                Label("Add Quest Builder", systemImage: "scroll")
                            }
                            Button(action: {
                                isAddingReligionCulture = true
                            }) {
                                Label("Add Religion/Culture", systemImage: "cross")
                            }
                            Button(action: {
                                isAddingCalendar = true
                            }) {
                                Label("Add Fantasy Calendar", systemImage: "calendar")
                            }
                            Button(action: {
                                isAddingNote = true
                            }) {
                                Label("Brainstorm", systemImage: "brain")
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .sheet(isPresented: $isAddingFolder) {
                // Add Folder sheet
                newFolderView(isPresented: $isAddingFolder, newFolderName: $newFolderName) { name in
                    viewModel.folders.append(Folder(name: name))
                    isAddingFolder = false // Close the sheet
                } onCancel: {
                    isAddingFolder = false // Close the sheet
                }
            }
            .sheet(isPresented: $isAddingPlanet) {
                // Add Planet sheet
                newPlanetView(isPresented: $isAddingPlanet, newPlanetName: $newPlanetName) { name in
                    viewModel.planets.append(Planet(name: name))
                    isAddingPlanet = false // Close the sheet
                } onCancel: {
                    isAddingPlanet = false // Close the sheet
                }
            }
            .sheet(isPresented: $isAddingCityWorld) {
                // Add CityWorld sheet
                newCityWorldView(isPresented: $isAddingCityWorld, newCityWorldName: $newCityWorldName) { name in
                    viewModel.cityWorlds.append(CityWorld(name: name))
                    isAddingCityWorld = false // Close the sheet
                } onCancel: {
                    isAddingCityWorld = false // Close the sheet
                }
            }
            .sheet(isPresented: $isAddingCharacterSpecies) {
                // Add Character Species sheet
                newCharacterSpeciesView(isPresented: $isAddingCharacterSpecies, newCharacterName: $newCharacterSpeciesName) { name in
                    viewModel.characterSpecies.append(Species(name: name))
                    isAddingCharacterSpecies = false // Close the sheet
                } onCancel: {
                    isAddingCharacterSpecies = false // Close the sheet
                }
            }

            .sheet(isPresented: $isAddingLanguageConstruction) {
                // Add Language Construction sheet
                newLanguageConstructionView(isPresented: $isAddingLanguageConstruction, newLanguageConstructionName: $newLanguageConstructionName) { name in
                    viewModel.languageConstructions.append(LanguageConstruction(name: name))
                    isAddingLanguageConstruction = false // Close the sheet
                } onCancel: {
                    isAddingLanguageConstruction = false // Close the sheet
                }
            }

            .sheet(isPresented: $isAddingQuestBuilder) {
                // Add Quest Builder sheet
                newQuestBuilderView(isPresented: $isAddingQuestBuilder, newQuestName: $newQuestBuilderName) { name in
                    viewModel.questBuilders.append(QuestBuilder(name: name))
                    isAddingQuestBuilder = false // Close the sheet
                } onCancel: {
                    isAddingQuestBuilder = false // Close the sheet
                }
            }
            
            .sheet(isPresented: $isAddingReligionCulture) {
                // Add Religion Culture sheet
                newReligionCultureView(isPresented: $isAddingReligionCulture, newCultureName: $newReligionCultureName) { name in
                    viewModel.religionCultures.append(ReligionCulture(name: name))
                    isAddingReligionCulture = false // Close the sheet
                } onCancel: {
                    isAddingReligionCulture = false // Close the sheet
                }
            }
            .sheet(isPresented: $isAddingCalendar) {
                // Add Fantasy Calendar sheet
                newFantasyCalendarView(isPresented: $isAddingCalendar, newCalendarName: $newFantasyCalendarName) { name in
                    viewModel.fantasyCalendars.append(FantasyCalendar(name: name))
                    isAddingCalendar = false // Close the sheet
                } onCancel: {
                    isAddingCalendar = false // Close the sheet
                }
            }
            .sheet(isPresented: $isAddingNote) {
                // Add Brainstorm Note sheet
                newBrainstormNoteView(isPresented: $isAddingNote, newNotes: $newBrainstormNote) { note in
                    viewModel.brainstormNotes.append(BrainstormNote(name: note))
                    isAddingNote = false // Close the sheet
                } onCancel: {
                    isAddingNote = false // Close the sheet
                }
            }
            .buttonStyle(.plain)
            .foregroundColor(.pink)
            
        }
    }
}


struct FolderDetailView: View {
    let folder: Folder
    @ObservedObject var viewModel = ContentViewModel()
    @State private var isAddingFolder = false
    @State private var isAddingPlanet = false
    @State private var isAddingCityWorld = false
    @State private var isAddingCharacterSpecies = false
    @State private var isAddingLanguageConstruction = false
    @State private var isAddingQuestBuilder = false
    @State private var isAddingReligionCulture = false
    @State private var isAddingCalendar = false
    @State private var isAddingNote = false
    @State private var newFolderName = ""
    @State private var newPlanetName = ""
    @State private var newCityWorldName = ""
    @State private var newCharacterSpeciesName = ""
    @State private var newLanguageConstructionName = ""
    @State private var newQuestBuilderName = ""
    @State private var newReligionCultureName = ""
    @State private var newFantasyCalendarName = ""
    @State private var newBrainstormNote = ""
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Files")) {
                    ForEach(viewModel.planets.sorted(by: { $0.name < $1.name })) { planet in
                        NavigationLink(destination: PlanetDetailView(planet: planet)) {
                            HStack {
                                Image(systemName: "globe")
                                Text(planet.name)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.planets.remove(atOffsets: indexSet)
                    }
                    
                    ForEach(viewModel.cityWorlds.sorted(by: { $0.name < $1.name })) { cityWorld in
                        NavigationLink(destination: CityDetailView(cityWorld: cityWorld)) {
                            HStack {
                                Image(systemName: "building.2")
                                Text(cityWorld.name)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.cityWorlds.remove(atOffsets: indexSet)
                    }
                    
                    ForEach(viewModel.languageConstructions.sorted(by: { $0.name < $1.name })) { languageConstruction in
                        NavigationLink(destination: LanguageConstructionDetailView(languageConstruction: languageConstruction)) {
                            HStack {
                                Image(systemName: "text.book.closed")
                                Text(languageConstruction.name)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.languageConstructions.remove(atOffsets: indexSet)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("\(folder.name)")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {
                            isAddingPlanet = true
                        }) {
                            Label("Add Planet", systemImage: "globe")
                        }
                        Button(action: {
                            isAddingCityWorld = true
                        }) {
                            Label("Add CityWorld", systemImage: "building.2")
                        }
                        Button(action: {
                            isAddingCharacterSpecies = true
                        }) {
                            Label("Add Character Species", systemImage: "person")
                        }
                        Button(action: {
                            isAddingLanguageConstruction = true
                        }) {
                            Label("Add Language Construction", systemImage: "scribble")
                        }
                        Button(action: {
                            isAddingQuestBuilder = true
                        }) {
                            Label("Add Quest Builder", systemImage: "scroll")
                        }
                        Button(action: {
                            isAddingReligionCulture = true
                        }) {
                            Label("Add Religion/Culture", systemImage: "cross")
                        }
                        Button(action: {
                            isAddingCalendar = true
                        }) {
                            Label("Add Fantasy Calendar", systemImage: "calendar")
                        }
                        Button(action: {
                            isAddingNote = true
                        }) {
                            Label("Brainstorm", systemImage: "brain")
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isAddingPlanet) {
            // Add Planet sheet
            newPlanetView(isPresented: $isAddingPlanet, newPlanetName: $newPlanetName) { name in
                viewModel.planets.append(Planet(name: name))
                isAddingPlanet = false // Close the sheet
            } onCancel: {
                isAddingPlanet = false // Close the sheet
            }
        }
        .sheet(isPresented: $isAddingCityWorld) {
            // Add CityWorld sheet
            newCityWorldView(isPresented: $isAddingCityWorld, newCityWorldName: $newCityWorldName) { name in
                viewModel.cityWorlds.append(CityWorld(name: name))
                isAddingCityWorld = false // Close the sheet
            } onCancel: {
                isAddingCityWorld = false // Close the sheet
            }
        }
        .sheet(isPresented: $isAddingCharacterSpecies) {
            // Add Character Species sheet
            newCharacterSpeciesView(isPresented: $isAddingCharacterSpecies, newCharacterName: $newCharacterSpeciesName) { name in
                viewModel.characterSpecies.append(Species(name: name))
                isAddingCharacterSpecies = false // Close the sheet
            } onCancel: {
                isAddingCharacterSpecies = false // Close the sheet
            }
        }
        
        .sheet(isPresented: $isAddingLanguageConstruction) {
            // Add Language Construction sheet
            newLanguageConstructionView(isPresented: $isAddingLanguageConstruction, newLanguageConstructionName: $newLanguageConstructionName) { name in
                viewModel.languageConstructions.append(LanguageConstruction(name: name))
                isAddingLanguageConstruction = false // Close the sheet
            } onCancel: {
                isAddingLanguageConstruction = false // Close the sheet
            }
        }
        
        .sheet(isPresented: $isAddingQuestBuilder) {
            // Add Quest Builder sheet
            newQuestBuilderView(isPresented: $isAddingQuestBuilder, newQuestName: $newQuestBuilderName) { name in
                viewModel.questBuilders.append(QuestBuilder(name: name))
                isAddingQuestBuilder = false // Close the sheet
            } onCancel: {
                isAddingQuestBuilder = false // Close the sheet
            }
        }
        
        .sheet(isPresented: $isAddingReligionCulture) {
            // Add Religion Culture sheet
            newReligionCultureView(isPresented: $isAddingReligionCulture, newCultureName: $newReligionCultureName) { name in
                viewModel.religionCultures.append(ReligionCulture(name: name))
                isAddingReligionCulture = false // Close the sheet
            } onCancel: {
                isAddingReligionCulture = false // Close the sheet
            }
        }
        .sheet(isPresented: $isAddingCalendar) {
            // Add Fantasy Calendar sheet
            newFantasyCalendarView(isPresented: $isAddingCalendar, newCalendarName: $newFantasyCalendarName) { name in
                viewModel.fantasyCalendars.append(FantasyCalendar(name: name))
                isAddingCalendar = false // Close the sheet
            } onCancel: {
                isAddingCalendar = false // Close the sheet
            }
        }
        .sheet(isPresented: $isAddingNote) {
            // Add Brainstorm Note sheet
            newBrainstormNoteView(isPresented: $isAddingNote, newNotes: $newBrainstormNote) { note in
                viewModel.brainstormNotes.append(BrainstormNote(name: note))
                isAddingNote = false // Close the sheet
            } onCancel: {
                isAddingNote = false // Close the sheet
            }
        }
        .buttonStyle(.plain)
        .foregroundColor(.blue)
    }
}
    
struct PlanetDetailView: View {
    var planet: Planet
    
    @State private var name: String = ""
    @State private var altName: String = ""
    @State private var skyColor: String = ""
    @State private var moonNumber: Int = 0
    @State private var moonNames: [String] = []
    @State private var size: String = ""
    @State private var radiusMiles: String = ""
    @State private var radiusKm: String = ""
    @State private var gravity: String = ""
    @State private var temperatureLowCelsius: String = ""
    @State private var temperatureLowFahrenheit: String = ""
    @State private var temperatureHighCelsius: String = ""
    @State private var temperatureHighFahrenheit: String = ""
    @State private var averageSurfaceTemperatureCelsius: String = ""
    @State private var averageSurfaceTemperatureFahrenheit: String = ""
    @State private var lengthOfDay: String = ""
    @State private var lengthOfYear: String = ""
    @State private var seasonalVariation: String = ""
    @State private var surfaceWater: Int = 0
    @State private var subterraneanWater: Int = 0
    @State private var seasonalVariationDescription: String = ""
    @State private var selectedType: String = ""
    
    
    let types = ["Rocky", "Earth-Like", "Water-World", "Desert", "Humid", "Frozen", "Ice", "Gas", "Toxic"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    Text("Universe Details")
                        .font(.headline)
                    
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 10) // Indentation
                    
                    Picker("Type", selection: $selectedType) {
                        ForEach(types, id: \.self) { type in
                            Text(type)
                                .tag(type)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    
                    TextField("Alt Name", text: $altName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 10) // Indentation
                    
                    TextField("Sky Color", text: $skyColor)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 10) // Indentation
                }
                
                Divider()
                
                Group {
                    Text("Moons")
                        .font(.headline)
                    
                    VStack {
                        HStack {
                            Text("Number:")
                            Text("\(moonNumber)")
                                .fontWeight(.bold)
                            Spacer()
                            Button("Generate") {
                                moonNumber = Int.random(in: 1...10)
                                moonNames = Array(repeating: "", count: moonNumber)
                            }
                        }
                        
                        ForEach(0..<moonNumber, id: \.self) { index in
                            HStack {
                                Text("Moon \(index + 1):")
                                TextField("Moon Name", text: $moonNames[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.leading, 10) // Indentation
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    Divider()
                }
                
                Group {
                    Text("Planet Stats")
                        .font(.headline)
                    
                    VStack {
                        HStack {
                            Text("Size:")
                            TextField("x Earth", text: $size)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10) // Indentation
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .onChange(of: size) { newValue in
                                    if let number = Double(newValue), number >= 0.01 && number <= 10 {
                                        size = String(format: "%.2f", number)
                                    } else {
                                        size = ""
                                    }
                                }
                        }
                        
                        HStack {
                            Text("Radius:")
                            TextField("miles", text: $radiusMiles)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10) // Indentation
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .onChange(of: radiusMiles) { newValue in
                                    if let miles = Double(newValue) {
                                        let kilometers = round(miles * 1.60934)
                                        radiusKm = String(format: "%.0f", kilometers)
                                    } else {
                                        radiusKm = ""
                                    }
                                }
                            Text("/")
                            Text("\(radiusKm) km")
                        }
                        
                        HStack {
                            Text("Gravity:")
                            TextField("x Earth's Gravity", text: $gravity)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10) // Indentation
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                        }
                        
                        HStack {
                            Text("Temperature Range:")
                            TextField("Low: °C", text: $temperatureLowCelsius)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10) // Indentation
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .onChange(of: temperatureLowCelsius) { newValue in
                                    if let celsius = Double(newValue) {
                                        let fahrenheit = round((celsius * 9/5) + 32)
                                        temperatureLowFahrenheit = String(format: "%.0f", fahrenheit)
                                    } else {
                                        temperatureLowFahrenheit = ""
                                    }
                                    
                                    updateAverageSurfaceTemperature()
                                }
                            
                            Text("/")
                            
                            Text("\(temperatureLowFahrenheit) °F")
                        }
                        
                        HStack {
                            Text("High:")
                            TextField("°C", text: $temperatureHighCelsius)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10) // Indentation
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .onChange(of: temperatureHighCelsius) { newValue in
                                    if let celsius = Double(newValue) {
                                        let fahrenheit = round((celsius * 9/5) + 32)
                                        temperatureHighFahrenheit = String(format: "%.0f", fahrenheit)
                                    } else {
                                        temperatureHighFahrenheit = ""
                                    }
                                    
                                    updateAverageSurfaceTemperature()
                                }
                            
                            Text("/")
                            
                            Text("\(temperatureHighFahrenheit) °F")
                        }
                        
                        HStack {
                            Text("Average Surface Temperature:")
                            Text("\(averageSurfaceTemperatureCelsius) °C")
                            Text("/")
                            Text("\(averageSurfaceTemperatureFahrenheit) °F")
                        }
                    }
                    
                    Divider()
                }
                
                Group {
                    Text("Water Prevalence")
                        .font(.headline)
                    
                    VStack {
                        HStack {
                            Text("Surface Water:")
                            
                            TextField("Surface Water", value: $surfaceWater, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10) // Indentation
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                        }
                        
                        HStack {
                            Text("Subterranean:")
                            
                            TextField("Subterranean", value: $subterraneanWater, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10) // Indentation
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                        }
                        
                        let totalWaterPercentage = (surfaceWater + subterraneanWater)
                        Text("Water Prevalence: \(totalWaterPercentage)% (\(surfaceWater) surface water / \(subterraneanWater) subterranean)")
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                }
                
                Group {
                    Text("Planet Motion")
                        .font(.headline)
                    
                    VStack {
                        HStack {
                            Text("Length of Day:")
                            TextField("hours", text: $lengthOfDay)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10) // Indentation
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                        }
                        
                        HStack {
                            Text("Length of Year:")
                            TextField("Earth days", text: $lengthOfYear)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10) // Indentation
                                .foregroundColor(Color(.systemGray))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                        }
                    }
                    
                    Divider()
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(planet.name)
        }
        
        HStack {
            Button(action: {
                // Save logic here
            }) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action: {
                // Generate logic here
                let randomSize = String(format: "%.2f", Double.random(in: 0.01...10))
                let randomRadius = String(Int.random(in: 1000...10_000))
                let randomGravity = String(format: "%.2f", Double.random(in: 0.01...10))
                let randomLengthOfDay = Int.random(in: 1...100)
                let randomLengthOfYear = Int.random(in: 1...1000)
                let randomsurfaceWater = Int.random(in: 1...100)
                let variations = [
                    ("None", "[Name]'s circular orbit means temperature variations are caused by the day/night cycle only"),
                    ("Extreme", "The planet's axial tilt results in extremely long-lasting seasons"),
                    ("Distinct", "Multiple distinct seasons with notable temperature differences during the year"),
                    ("Slight", "Temperature varies only slightly based on the position of the planet over the year")
                ]
                let (randomVariation, description) = variations.randomElement() ?? ("None", "")
                seasonalVariation = randomVariation
                seasonalVariationDescription = description
                
                lengthOfDay = "\(randomLengthOfDay)"
                size = randomSize
                radiusMiles = randomRadius
                gravity = randomGravity
                lengthOfYear = "\(randomLengthOfYear)"
                let totalWater = 100
                surfaceWater = Int.random(in: 0...totalWater)
                subterraneanWater = totalWater - surfaceWater
                let temperatureRange: ClosedRange<Int>?
                
                switch selectedType {
                case "Rocky":
                    temperatureRange = 50...Int.max
                case "Earth-Like":
                    temperatureRange = 50...Int.max
                case "Water-World":
                    temperatureRange = 50...Int.max
                case "Desert":
                    temperatureRange = 50...Int.max
                case "Humid":
                    temperatureRange = Int.min...0
                case "Frozen":
                    temperatureRange = Int.min...0
                case "Ice":
                    temperatureRange = Int.min...0
                case "Gas":
                    temperatureRange = 100...Int.max
                case "Toxic":
                    temperatureRange = Int.min...Int.max
                default:
                    temperatureRange = nil
                }
                
                if let temperatureRange = temperatureRange {
                    if let lowerBound = temperatureRange.lowerBound as Int? {
                        temperatureLowCelsius = "\(lowerBound)"
                        temperatureLowFahrenheit = String(format: "%.0f", (Double(lowerBound) * 9/5) + 32)
                    }
                    
                    if let upperBound = temperatureRange.upperBound as Int? {
                        temperatureHighCelsius = "\(upperBound)"
                        temperatureHighFahrenheit = String(format: "%.0f", (Double(upperBound) * 9/5) + 32)
                    }
                }
                
                updateAverageSurfaceTemperature()
                
            }){
                Text("Generate")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    private func updateAverageSurfaceTemperature() {
        if let lowCelsius = Double(temperatureLowCelsius),
           let highCelsius = Double(temperatureHighCelsius) {
            let averageCelsius = (lowCelsius + highCelsius) / 2
            averageSurfaceTemperatureCelsius = String(format: "%.0f", averageCelsius)
            
            let averageFahrenheit = round((averageCelsius * 9/5) + 32)
            averageSurfaceTemperatureFahrenheit = String(format: "%.0f", averageFahrenheit)
        } else {
            averageSurfaceTemperatureCelsius = ""
            averageSurfaceTemperatureFahrenheit = ""
        }
    }
}

    
    struct CityDetailView: View {
        var cityWorld: CityWorld
        
        var body: some View {
            Text("City World Detail: \(cityWorld.name)")
        }
    }
    
    struct LanguageConstructionDetailView: View {
        var languageConstruction: LanguageConstruction
        
        var body: some View {
            Text("Language Construction Detail: \(languageConstruction.name)")
        }
    }
    
    struct CharacterSpeciesDetailView: View {
        var species: Species
        
        var body: some View {
            Text("Character Species Detail: \(species.name)")
        }
    }
    
    struct ReligionCultureDetailView: View {
        var religionCulture: ReligionCulture
        
        var body: some View {
            Text("Religion Culture Detail: \(religionCulture.name)")
        }
    }
    
    struct QuestBuilderDetailView: View {
        var questBuilder: QuestBuilder
        
        var body: some View {
            Text("Quest Builder Detail: \(questBuilder.name)")
        }
    }

    struct FantasyCalendarDetailView: View {
        var fantasyCalendar: FantasyCalendar
        
        var body: some View {
            Text("Fantasy Calendar Detail: \(fantasyCalendar.name)")
        }
    }

    struct BrainstormNoteDetailView: View {
        var brainstormNote: BrainstormNote
        
        var body: some View {
            Text("Notes Detail: \(brainstormNote.name)")
        }
    }
    
    struct newFolderView: View {
        @Binding var isPresented: Bool
        @Binding var newFolderName: String
        
        var onSave: (String) -> Void
        var onCancel: () -> Void
        
        var body: some View {
            VStack {
                Text("New Folder")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Folder Name", text: $newFolderName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Button("Cancel") {
                        onCancel()
                    }
                    .padding()
                    
                    Button("Save") {
                        onSave(newFolderName)
                    }
                    .padding()
                    .foregroundColor(.blue)
                }
            }
        }
    }
    
    struct newPlanetView: View {
        @Binding var isPresented: Bool
        @Binding var newPlanetName: String
        
        var onSave: (String) -> Void
        var onCancel: () -> Void
        
        var body: some View {
            VStack {
                Text("New Planet")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Planet Name", text: $newPlanetName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Button("Cancel") {
                        onCancel()
                    }
                    .padding()
                    
                    Button("Save") {
                        onSave(newPlanetName)
                    }
                    .padding()
                    .foregroundColor(.red)
                }
            }
        }
    }
    
    struct newCityWorldView: View {
        @Binding var isPresented: Bool
        @Binding var newCityWorldName: String
        
        var onSave: (String) -> Void
        var onCancel: () -> Void
        
        var body: some View {
            VStack {
                Text("New City World")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("CityWorld Name", text: $newCityWorldName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Button("Cancel") {
                        onCancel()
                    }
                    .padding()
                    
                    Button("Save") {
                        onSave(newCityWorldName)
                        onCancel() // Close the sheet after saving
                    }
                    .padding()
                    .foregroundColor(.blue)
                }
            }
        }
    }
    
    struct newLanguageConstructionView: View {
        @Binding var isPresented: Bool
        @Binding var newLanguageConstructionName: String
        
        var onSave: (String) -> Void
        var onCancel: () -> Void
        
        var body: some View {
            VStack {
                Text("New Language Construction")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Language Construction Name", text: $newLanguageConstructionName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Button("Cancel") {
                        onCancel()
                    }
                    .padding()
                    
                    Button("Save") {
                        onSave(newLanguageConstructionName)
                        onCancel() // Close the sheet after saving
                    }
                    .padding()
                    .foregroundColor(.green)
                }
            }
        }
    }

struct newCharacterSpeciesView: View {
    @Binding var isPresented: Bool
    @Binding var newCharacterName: String
    
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        VStack {
            Text("New Character/Species")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            TextField("Character/Species Name", text: $newCharacterName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                Button("Cancel") {
                    onCancel()
                }
                .padding()
                
                Button("Save") {
                    onSave(newCharacterName)
                }
                .padding()
                .foregroundColor(.blue)
            }
        }
    }
}

struct newQuestBuilderView: View {
    @Binding var isPresented: Bool
    @Binding var newQuestName: String
    
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        VStack {
            Text("New Character/Species")
                .fontWeight(.bold)
                .padding()
            
            TextField("Character/Species Name", text: $newQuestName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                Button("Cancel") {
                    onCancel()
                }
                .padding()
                
                Button("Save") {
                    onSave(newQuestName)
                }
                .padding()
                .foregroundColor(.red)
            }
        }
    }
}

struct newReligionCultureView: View {
    @Binding var isPresented: Bool
    @Binding var newCultureName: String
    
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        VStack {
            Text("New Religion/Culture")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            TextField("Religion/Culture Name", text: $newCultureName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                Button("Cancel") {
                    onCancel()
                }
                .padding()
                
                Button("Save") {
                    onSave(newCultureName)
                    onCancel() // Close the sheet after saving
                }
                .padding()
                .foregroundColor(.blue)
            }
        }
    }
}

struct newFantasyCalendarView: View {
    @Binding var isPresented: Bool
    @Binding var newCalendarName: String
    
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        VStack {
            Text("Name of the Calendar")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            TextField("Name of the Calendar", text: $newCalendarName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                Button("Cancel") {
                    onCancel()
                }
                .padding()
                
                Button("Save") {
                    onSave(newCalendarName)
                    onCancel() // Close the sheet after saving
                }
                .padding()
                .foregroundColor(.green)
            }
        }
    }
}

struct newBrainstormNoteView: View {
    @Binding var isPresented: Bool
    @Binding var newNotes: String
    
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        VStack {
            Text("Name of Storm")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            TextField("Name of Storm", text: $newNotes)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                Button("Cancel") {
                    onCancel()
                }
                .padding()
                
                Button("Save") {
                    onSave(newNotes)
                    onCancel() // Close the sheet after saving
                }
                .padding()
                .foregroundColor(.green)
            }
        }
    }
}
    
struct userProfileView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 16) {
            Circle()
                .foregroundColor(.gray)
                .frame(width: 120, height: 120)
                .overlay(
                    Image(user.profileImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 110)
                )
            
            Text(user.name)
                .font(.title)
            
            HStack(spacing: 24) {
                VStack {
                    Text("\(user.followers)")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("Followers")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                VStack {
                    Text("\(user.following)")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("Following")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                VStack {
                    Text("\(user.posts)")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("Posts")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: Color(.black).opacity(0.2), radius: 5, x: 0, y: 2)
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        VStack {
            Image(user.profileImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text(user.name)
                .font(.headline)
            
            HStack {
                Label("\(user.followers)", systemImage: "person.fill")
                Label("\(user.following)", systemImage: "person.2.fill")
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct FolderDetailView: View {
    let folder: Folder
    
    var body: some View {
        Text("Folder Detail View")
            .navigationTitle(folder.name)
    }
}

struct Planet: Identifiable {
    let id = UUID()
    let name: String
}

struct UniverseDetailView: View {
    let universe: Universe
    @StateObject var viewModel = ContentViewModel()
    @State private var isAddingFolder = false
    @State private var newFolderName = ""

    var body: some View {
        VStack {
            HStack {
                Text(universe.name)
                    .font(.title)
                
                Spacer()
                
                Button(action: {
                    isAddingFolder = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }
            }

            List {
                Section(header: Text("Folders")) {
                    ForEach(viewModel.folders) { folder in
                        NavigationLink(destination: FolderDetailView(folder: folder)) {
                            Text(folder.name)
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.folders.remove(atOffsets: indexSet)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationBarItems(trailing: EditButton())
        .navigationTitle("")
        .sheet(isPresented: $isAddingFolder) {
            NewFolderView(isAddingFolder: $isAddingFolder, newFolderName: $newFolderName) { name in
                // Save folder logic
                viewModel.folders.append(Folder(name: name))
            } onCancel: {
                // Cancel folder creation logic
                isAddingFolder = false
            }
        }
    }
}


struct NewPlanetView: View {
    @Binding var isAddingPlanet: Bool
    @Binding var newPlanetName: String
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Planet Name", text: $newPlanetName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(newPlanetName)
                        isAddingPlanet = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("New Planet")
        }
    }
}


struct CityWorldDetailView: View {
    let cityWorld: CityWorld
    
    var body: some View {
        Text("City World Detail View")
            .navigationTitle(cityWorld.name)
    }
}

struct CharacterSpeciesDetailView: View {
    let characterSpecies: CharacterSpecies
    
    var body: some View {
        Text("Character Species Detail View")
            .navigationTitle(characterSpecies.name)
    }
}

struct LanguageConstructionDetailView: View {
    let languageConstruction: LanguageConstruction
    
    var body: some View {
        Text("Language Construction Detail View")
            .navigationTitle(languageConstruction.name)
    }
}

struct QuestBuilderDetailView: View {
    let questBuilder: QuestBuilder
    
    var body: some View {
        Text("Quest Builder Detail View")
            .navigationTitle(questBuilder.name)
    }
}

struct ReligionCultureDetailView: View {
    let religionCulture: ReligionCulture
    
    var body: some View {
        Text("Religion Culture Detail View")
            .navigationTitle(religionCulture.name)
    }
}

struct CalendarDetailView: View {
    let calendar: CalendarModel
    
    var body: some View {
        Text("Calendar Detail View")
            .navigationTitle(calendar.name)
    }
}

struct NoteDetailView: View {
    let note: Note
    
    var body: some View {
        Text("Note Detail View")
            .navigationTitle(note.name)
    }
}

struct NewFolderView: View {
    @Binding var isAddingFolder: Bool
    @Binding var newFolderName: String
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Folder Name", text: $newFolderName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(newFolderName)
                        isAddingFolder = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("New Folder")
        }
    }
}

struct NewUniverseView: View {
    @Binding var isAddingUniverse: Bool
    @Binding var newUniverseName: String
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Universe Name", text: $newUniverseName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(newUniverseName)
                        isAddingUniverse = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("New Universe")
        }
    }
}

struct NewCityWorldView: View {
    @Binding var isAddingCityWorld: Bool
    @Binding var newCityWorldName: String
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("City World Name", text: $newCityWorldName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(newCityWorldName)
                        isAddingCityWorld = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("New City World")
        }
    }
}

struct NewCharacterSpeciesView: View {
    @Binding var isAddingCharacterSpecies: Bool
    @Binding var newCharacterSpeciesName: String
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Character Species Name", text: $newCharacterSpeciesName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(newCharacterSpeciesName)
                        isAddingCharacterSpecies = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("New Character Species")
        }
    }
}

struct NewLanguageConstructionView: View {
    @Binding var isAddingLanguageConstruction: Bool
    @Binding var newLanguageConstructionName: String
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Language Construction Name", text: $newLanguageConstructionName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(newLanguageConstructionName)
                        isAddingLanguageConstruction = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("New Language Construction")
        }
    }
}

struct NewQuestBuilderView: View {
    @Binding var isAddingQuestBuilder: Bool
    @Binding var newQuestBuilderName: String
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Quest Builder Name", text: $newQuestBuilderName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(newQuestBuilderName)
                        isAddingQuestBuilder = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("New Quest Builder")
        }
    }
}

struct NewReligionCultureView: View {
    @Binding var isAddingReligionCulture: Bool
    @Binding var newReligionCultureName: String
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Religion Culture Name", text: $newReligionCultureName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(newReligionCultureName)
                        isAddingReligionCulture = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("New Religion Culture")
        }
    }
}

struct NewCalendarView: View {
    @Binding var isAddingCalendar: Bool
    @Binding var newCalendarName: String
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Calendar Name", text: $newCalendarName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(newCalendarName)
                        isAddingCalendar = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("New Calendar")
        }
    }
}

struct NewNoteView: View {
    @Binding var isAddingNote: Bool
    @Binding var newNoteName: String
    var onSave: (String) -> Void
    var onCancel: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Note Name", text: $newNoteName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(newNoteName)
                        isAddingNote = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("New Note")
        }
    }
}


struct MainPageView: View {
    var body: some View {
        Text("Main Post")
    }
}


struct ContentView: View {
    var body: some View {
        HomePageView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
