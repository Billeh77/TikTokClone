//
//  ImageUploader.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
    func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.35) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error \(error)")
            return nil
        }
    }
}
