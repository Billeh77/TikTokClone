//
//  EditProfileManager.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import UIKit
import Firebase
import FirebaseAuth

class EditProfileManager: ObservableObject {
    private let imageUploader: ImageUploader
    
    init(imageUploader: ImageUploader) {
        self.imageUploader = imageUploader
    }
    
    func uploadProfileImage(_ uiImage: UIImage) async {
        do {
            let profileImageUrl = try await imageUploader.uploadImage(image: uiImage)
            try await updateUserProfileImageUrl(profileImageUrl)
        } catch {
            print("DEBUG: Handle error uploading profile image")
        }
    }
    
    private func updateUserProfileImageUrl(_ imageUrl: String?) async throws {
        guard let imageUrl else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        try await FirestoreConstants.usersCollection.document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
        
    }
}
