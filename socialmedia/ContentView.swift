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

struct WorldView: View {
    @StateObject var viewModel = ContentViewModel()
    @State private var selectedFolder: Folder?
    @State private var selectedUniverse: Universe?
    @State private var selectedCityWorld: CityWorld?
    @State private var selectedCharacterSpecies: CharacterSpecies?
    @State private var selectedLanguageConstruction: LanguageConstruction?
    @State private var selectedQuestBuilder: QuestBuilder?
    @State private var selectedReligionCulture: ReligionCulture?
    @State private var selectedCalendar: CalendarModel?
    @State private var selectedNote: Note?
    @State private var isAddingFolder = false
    @State private var isAddingUniverse = false
    @State private var isAddingCityWorld = false
    @State private var isAddingCharacterSpecies = false
    @State private var isAddingLanguageConstruction = false
    @State private var isAddingQuestBuilder = false
    @State private var isAddingReligionCulture = false
    @State private var isAddingCalendar = false
    @State private var isAddingNote = false
    @State private var newFolderName = ""
    @State private var newUniverseName = ""
    @State private var newCityWorldName = ""
    @State private var newCharacterSpeciesName = ""
    @State private var newLanguageConstructionName = ""
    @State private var newQuestBuilderName = ""
    @State private var newReligionCultureName = ""
    @State private var newCalendarName = ""
    @State private var newNoteName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("User")) {
                        UserProfileView(user: viewModel.user)
                    }
                    
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
                    
                    Section(header: Text("Universe")) {
                        ForEach(viewModel.universes) { universe in
                            NavigationLink(destination: UniverseDetailView(universe: universe)) {
                                Text(universe.name)
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.universes.remove(atOffsets: indexSet)
                        }
                    }
                    
                    Section(header: Text("City World")) {
                        ForEach(viewModel.cityWorlds) { cityWorld in
                            NavigationLink(destination: CityWorldDetailView(cityWorld: cityWorld)) {
                                Text(cityWorld.name)
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.cityWorlds.remove(atOffsets: indexSet)
                        }
                    }
                    
                    Section(header: Text("Character Species")) {
                        ForEach(viewModel.characterSpecies) { characterSpecies in
                            NavigationLink(destination: CharacterSpeciesDetailView(characterSpecies: characterSpecies)) {
                                Text(characterSpecies.name)
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.characterSpecies.remove(atOffsets: indexSet)
                        }
                    }
                    
                    Section(header: Text("Language Construction")) {
                        ForEach(viewModel.languageConstructions) { languageConstruction in
                            NavigationLink(destination: LanguageConstructionDetailView(languageConstruction: languageConstruction)) {
                                Text(languageConstruction.name)
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.languageConstructions.remove(atOffsets: indexSet)
                        }
                    }
                    
                    Section(header: Text("Quest Builder")) {
                        ForEach(viewModel.questBuilders) { questBuilder in
                            NavigationLink(destination: QuestBuilderDetailView(questBuilder: questBuilder)) {
                                Text(questBuilder.name)
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.questBuilders.remove(atOffsets: indexSet)
                        }
                    }
                    
                    Section(header: Text("Religion Culture")) {
                        ForEach(viewModel.religionCultures) { religionCulture in
                            NavigationLink(destination: ReligionCultureDetailView(religionCulture: religionCulture)) {
                                Text(religionCulture.name)
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.religionCultures.remove(atOffsets: indexSet)
                        }
                    }
                    
                    Section(header: Text("Calendar")) {
                        ForEach(viewModel.calendars) { calendar in
                            NavigationLink(destination: CalendarDetailView(calendar: calendar)) {
                                Text(calendar.name)
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.calendars.remove(atOffsets: indexSet)
                        }
                    }
                    
                    Section(header: Text("Notes")) {
                        ForEach(viewModel.notes) { note in
                            NavigationLink(destination: NoteDetailView(note: note)) {
                                Text(note.name)
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.notes.remove(atOffsets: indexSet)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("THE BESTIARY")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {
                            isAddingFolder = true
                        }) {
                            Label("Add Folder", systemImage: "folder.badge.plus")
                        }
                        
                        Button(action: {
                            isAddingUniverse = true
                        }) {
                            Label("Add Universe", systemImage: "globe")
                        }
                        
                        Button(action: {
                            isAddingCityWorld = true
                        }) {
                            Label("Add City World", systemImage: "building.2.crop.circle")
                        }
                        
                        Button(action: {
                            isAddingCharacterSpecies = true
                        }) {
                            Label("Add Character Species", systemImage: "person.2")
                        }
                        
                        Button(action: {
                            isAddingLanguageConstruction = true
                        }) {
                            Label("Add Language Construction", systemImage: "textformat")
                        }
                        
                        Button(action: {
                            isAddingQuestBuilder = true
                        }) {
                            Label("Add Quest Builder", systemImage: "scroll")
                        }
                        
                        Button(action: {
                            isAddingReligionCulture = true
                        }) {
                            Label("Add Religion Culture", systemImage: "cross.circle")
                        }
                        
                        Button(action: {
                            isAddingCalendar = true
                        }) {
                            Label("Add Calendar", systemImage: "calendar")
                        }
                        
                        Button(action: {
                            isAddingNote = true
                        }) {
                            Label("Add Note", systemImage: "note.text")
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
            }
            .sheet(isPresented: $isAddingFolder) {
                NewFolderView(isAddingFolder: $isAddingFolder, newFolderName: $newFolderName) { name in
                    // Save folder logic
                    viewModel.folders.append(Folder(name: name))
                } onCancel: {
                    // Cancel folder creation logic
                    isAddingFolder = false
                }
            }
            .sheet(isPresented: $isAddingUniverse) {
                NewUniverseView(isAddingUniverse: $isAddingUniverse, newUniverseName: $newUniverseName) { name in
                    // Save universe logic
                    viewModel.universes.append(Universe(name: name))
                } onCancel: {
                    // Cancel universe creation logic
                    isAddingUniverse = false
                }
            }
            .sheet(isPresented: $isAddingCityWorld) {
                NewCityWorldView(isAddingCityWorld: $isAddingCityWorld, newCityWorldName: $newCityWorldName) { name in
                    // Save city world logic
                    viewModel.cityWorlds.append(CityWorld(name: name))
                } onCancel: {
                    // Cancel city world creation logic
                    isAddingCityWorld = false
                }
            }
            .sheet(isPresented: $isAddingCharacterSpecies) {
                NewCharacterSpeciesView(isAddingCharacterSpecies: $isAddingCharacterSpecies, newCharacterSpeciesName: $newCharacterSpeciesName) { name in
                    // Save character species logic
                    viewModel.characterSpecies.append(CharacterSpecies(name: name))
                } onCancel: {
                    // Cancel character species creation logic
                    isAddingCharacterSpecies = false
                }
            }
            .sheet(isPresented: $isAddingLanguageConstruction) {
                NewLanguageConstructionView(isAddingLanguageConstruction: $isAddingLanguageConstruction, newLanguageConstructionName: $newLanguageConstructionName) { name in
                    // Save language construction logic
                    viewModel.languageConstructions.append(LanguageConstruction(name: name))
                } onCancel: {
                    // Cancel language construction creation logic
                    isAddingLanguageConstruction = false
                }
            }
            .sheet(isPresented: $isAddingQuestBuilder) {
                NewQuestBuilderView(isAddingQuestBuilder: $isAddingQuestBuilder, newQuestBuilderName: $newQuestBuilderName) { name in
                    // Save quest builder logic
                    viewModel.questBuilders.append(QuestBuilder(name: name))
                } onCancel: {
                    // Cancel quest builder creation logic
                    isAddingQuestBuilder = false
                }
            }
            .sheet(isPresented: $isAddingReligionCulture) {
                NewReligionCultureView(isAddingReligionCulture: $isAddingReligionCulture, newReligionCultureName: $newReligionCultureName) { name in
                    // Save religion culture logic
                    viewModel.religionCultures.append(ReligionCulture(name: name))
                } onCancel: {
                    // Cancel religion culture creation logic
                    isAddingReligionCulture = false
                }
            }
            .sheet(isPresented: $isAddingCalendar) {
                NewCalendarView(isAddingCalendar: $isAddingCalendar, newCalendarName: $newCalendarName) { name in
                    // Save calendar logic
                    viewModel.calendars.append(CalendarModel(name: name))
                } onCancel: {
                    // Cancel calendar creation logic
                    isAddingCalendar = false
                }
            }
            .sheet(isPresented: $isAddingNote) {
                NewNoteView(isAddingNote: $isAddingNote, newNoteName: $newNoteName) { name in
                    // Save note logic
                    viewModel.notes.append(Note(name: name))
                } onCancel: {
                    // Cancel note creation logic
                    isAddingNote = false
                }
            }
            
            Text("Select an item")
        }
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
