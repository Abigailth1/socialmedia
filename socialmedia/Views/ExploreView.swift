import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(User.MOCK_USERS) { user in
                        //                        Section(header: Text(user.name)) {
                        //                            ForEach(user.projects) { project in
                        NavigationLink(value: user) {
                            HStack {
                                if let profileImage = user.profileImageUrl {
                                    Image(profileImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                }else{
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                }
                                    
                                
                                VStack(alignment: .leading) {
                                    //                                                ProjectListItem(project: project)
                                    Text(user.username)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                    
                                    Text(user.bio ?? "No bio")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .font(.footnote)
                                
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .navigationDestination(for: User.self, destination: { user in
                                ProfileView(user: user)
                            })
                        }
                        
                        Divider()
                        
                        
                    }
                }
                .searchable(text: $searchText, prompt: "Search")
                .padding(.vertical, 10)
            }
            .navigationBarTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


//        NavigationView {
//            List {
//                ForEach(User2.exampleUsers) { user in
//                    Section(header: Text(user.name)) {
//                        ForEach(user.projects) { project in
//                            NavigationLink(destination: ProjectDetailsView(project: .constant(project))) {
//                                ProjectListItem(project: project)
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationBarTitle("Explore")
//        }

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
