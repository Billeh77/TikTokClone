//
//  EditProfileOptions.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import Foundation

enum EditProfileOptions: Hashable {
    case name
    case username
    case bio
    
    var title: String {
        switch self {
        case .name: 
            return "Name"
        case .username: 
            return "Username"
        case .bio: 
            return "Bio"
        }
    }
}
