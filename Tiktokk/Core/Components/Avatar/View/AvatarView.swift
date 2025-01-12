//
//  AvatarView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/26/24.
//

import SwiftUI
import Kingfisher

struct AvatarView: View {
    
    let user: User?
    let size: AvatarSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    AvatarView(user: DeveloperPreview.user, size: .medium)
}
