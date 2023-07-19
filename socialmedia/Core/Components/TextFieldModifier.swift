//
//  TextFieldModifier.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/19/23.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
            .padding(.horizontal, 50)
    }
}
