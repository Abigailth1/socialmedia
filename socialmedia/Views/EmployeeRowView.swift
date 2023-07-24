//
//  EmployeeRowView.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/24/23.
//

import SwiftUI

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


struct EmployeeRowView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeRowView(employee: Employee.init(name: "name", role: "role"))
    }
}
