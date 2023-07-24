//
//  ProductionStudioProfileView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

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


struct ProductionStudioProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProductionStudioProfileView(userProfile: UserProfile.init(name: "name", role: "role", interests: ["eating"]))
    }
}
