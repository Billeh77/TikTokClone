//
//  User.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let username: String
    let email: String
    let fullName: String
    var bio: String?
    var profileImageUrl: String?
}

extension User: Hashable { }
    

