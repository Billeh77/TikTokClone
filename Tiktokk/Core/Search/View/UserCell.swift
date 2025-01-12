//
//  UserCell.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/22/24.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            AvatarView(user: user, size: .medium)
                
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(user.fullName)
                    .font(.footnote)
            }
            
            Spacer()
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    UserCell(user: DeveloperPreview.user)
}
