//
//  Movie.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/26/24.
//

import Foundation
import AVKit
import PhotosUI
import SwiftUI

struct Movie: Transferable {
    let url: URL
    
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .movie) { movie in
            SentTransferredFile(movie.url)
        } importing: { recived in
            let copy = URL.documentsDirectory.appending(path: "movie.mp4")
            
            if FileManager.default.fileExists(atPath: copy.path()) {
                try FileManager.default.removeItem(at: copy)
            }
            
            try FileManager.default.copyItem(at: recived.file, to: copy)
            
            return Movie(url: copy)
        }
    }
}
