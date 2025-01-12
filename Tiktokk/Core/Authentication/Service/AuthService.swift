//
//  AuthService.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: User logged in is \(result.user.uid)")
        } catch {
            print("DEBUG: Error logging in user with \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String, password: String, username: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, id: result.user.uid, password: password, username: username, fullname: fullname)
        } catch {
            print("DEBUG: Error creating user with \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(withEmail email: String, id: String, password: String, username: String, fullname: String) async throws {
        let user = User(id: id, username: username, email: email, fullName: fullname)
        try await UserService().uploadUserData(user)
    }
}
