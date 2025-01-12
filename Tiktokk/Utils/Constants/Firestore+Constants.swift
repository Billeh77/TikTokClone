//
//  Firestore+Constants.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import Foundation
import Firebase
import FirebaseFirestore

struct FirestoreConstants {
    static let root = Firestore.firestore()
    
    static let usersCollection = root.collection("users")
}
