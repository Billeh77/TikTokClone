//
//  PreviewProvider.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import Foundation

struct DeveloperPreview {
    
    static var user = User(
        id: NSUUID().uuidString,
        username: "billehemile",
        email: "billehemile@gmail.com",
        fullName: "Emile Billeh"
    )
    
    static var users: [User] = [
        .init(id: NSUUID().uuidString, username: "mock.user.1", email: "mock.user.1@gmail.com", fullName: "Mock User1"),
        .init(id: NSUUID().uuidString, username: "mock.user.2", email: "mock.user.2@gmail.com", fullName: "Mock User2"),
        .init(id: NSUUID().uuidString, username: "mock.user.3", email: "mock.user.3@gmail.com", fullName: "Mock User3"),
        .init(id: NSUUID().uuidString, username: "mock.user.4", email: "mock.user.4@gmail.com", fullName: "Mock User4")
        
    ]
}
