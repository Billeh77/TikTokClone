//
//  ExploreView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/22/24.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel(userService: UserService()) //Gives Firestore data
    //@StateObject var viewModel = ExploreViewModel(userService: MockUserService())
    //Gives Mock Data
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            UserCell(user: user)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                GuestProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    ExploreView()
}
