//
//  File.swift
//  socialmedia
//
//  Created by Daniel Maliro on 7/19/23.
//

import Foundation
import Firebase
import Combine

class ContentViewModel: ObservableObject {
    
    //listen to when ViewModel is set
    private let service = AuthViewModel.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] user in
            self?.userSession = user
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }
        .store(in: &cancellables)
    }
    
    
}

