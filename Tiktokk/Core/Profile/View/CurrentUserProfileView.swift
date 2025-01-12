//
//  CurrentUserProfileView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/22/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let authService: AuthService
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    //Profile Header
                    ProfileHeaderView(user: user)
                    
                    //Post Grid View
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        authService.signOut()
                    } label: {
                        Text("Sign Out")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(authService: AuthService(), user: DeveloperPreview.user)
}
