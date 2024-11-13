//
//  Session.swift
//  RestMap
//
//  Created by Elliott Griffin on 10/19/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class SessionStore: ObservableObject {
    @Published var currentUser: User?

    func listen() {
        _ = Auth.auth().addStateDidChangeListener { auth, user in
            self.currentUser = user
        }
    }

    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.currentUser = authResult?.user
                completion(.success(()))
            }
        }
    }

    func signUp(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.currentUser = authResult?.user
                completion(.success(()))
            }
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.currentUser = nil
    }
}
