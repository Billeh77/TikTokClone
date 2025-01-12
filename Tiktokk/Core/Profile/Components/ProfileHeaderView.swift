//
//  ProfileHeaderView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/22/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var isEditProfileShowing = false
    
    let user: User
    
    var body: some View {
        VStack(spacing: 16) {
            
            VStack(spacing: 8) {
                //Profile Image
                AvatarView(user: user, size: .large)
                
                //Username
                Text("@\(user.username)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
            }
            
            HStack(spacing: 16) {
                UserStatsView(statValue: 5, statLabel: "Following")
                UserStatsView(statValue: 7, statLabel: "Followers")
                UserStatsView(statValue: 2, statLabel: "Likes")
            }
            
            //Acion Button
            Button {
                isEditProfileShowing.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            
            Divider()
        }
        .fullScreenCover(isPresented: $isEditProfileShowing) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.user)
}
