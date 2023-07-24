import SwiftUI

struct JobPostingView: View {
    @State private var jobTitle: String = ""
    @State private var jobDescription: String = ""
    @State private var jobRole: JobRole = .scriptwriter
    @State private var jobListings: [JobListing] = [] // Store job listings

    enum JobRole: String, CaseIterable {
        case scriptwriter
        case director
        case actor
        case animator

        var displayName: String {
            switch self {
            case .scriptwriter:
                return "Scriptwriter"
            case .director:
                return "Director"
            case .actor:
                return "Actor"
            case .animator:
                return "Animator"
            }
        }
        
        var color: Color {
            switch self {
            case .scriptwriter:
                return Color.blue
            case .director:
                return Color.purple
            case .actor:
                return Color.blue
            case .animator:
                return Color.purple
            }
        }
    }

    struct JobListing: Identifiable {
        var id = UUID()
        var title: String
        var description: String
        var role: JobRole
        var applicants: [Applicant]
    }

    struct Applicant: Identifiable {
        var id = UUID()
        var name: String
        var email: String
        var role: JobRole
    }

    var body: some View {
        NavigationView {
            VStack {
                // Job posting form
                Form {
                    Section(header: Text("Job Details").foregroundColor(jobRole.color)) {
                        Picker("Job Role", selection: $jobRole) {
                            ForEach(JobRole.allCases, id: \.self) { role in
                                Text(role.displayName).tag(role)
                            }
                        }
                        TextField("Job Title", text: $jobTitle)
                        TextField("Job Description", text: $jobDescription)
                    }

                    Button(action: addJobListing) {
                        Text("Post Job")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(jobRole.color)
                            .cornerRadius(10)
                    }
                    .listRowBackground(jobRole.color)
                }
                .accentColor(jobRole.color)

                // Job listings
                List(jobListings) { job in
                    VStack(alignment: .leading) {
                        Text(job.title)
                            .font(.headline)
                            .foregroundColor(jobRole.color)
                        Text(job.description)
                            .foregroundColor(.secondary)
                        Button(action: {
                            applyToJob(job: job)
                        }) {
                            Text("Apply")
                                .foregroundColor(.white)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(jobRole.color)
                                .cornerRadius(5)
                        }
                        .accentColor(.white)
                        .padding(.top, 5)
                    }
                }
            }
            .navigationBarTitle("Job Postings")
            .navigationBarColor(jobRole.color)
        }
    }

    private func addJobListing() {
        let newJobListing = JobListing(title: jobTitle, description: jobDescription, role: jobRole, applicants: [])
        jobListings.append(newJobListing)
        clearJobForm()
    }

    private func clearJobForm() {
        jobTitle = ""
        jobDescription = ""
        jobRole = .scriptwriter
    }

    private func applyToJob(job: JobListing) {
        let applicant = Applicant(name: "Your Name", email: "Your Email", role: job.role)
        var updatedJob = job
        updatedJob.applicants.append(applicant)
        if let index = jobListings.firstIndex(where: { $0.id == job.id }) {
            jobListings[index] = updatedJob
        }
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: Color) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: Color

    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor // Add the missing initialization here
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(backgroundColor)
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
    }

    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct JobPostingView_Previews: PreviewProvider {
    static var previews: some View {
        JobPostingView()
    }
}
