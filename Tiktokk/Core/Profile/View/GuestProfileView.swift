//
//  GuestProfileView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/25/24.
//

import SwiftUI

struct GuestProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 2) {
                //Profile Header
                ProfileHeaderView(user: user)
                
                //Post Grid View
                PostGridView()
            }
            .padding(.top)
        }
    }
}

#Preview {
    GuestProfileView(user: DeveloperPreview.user)
}
