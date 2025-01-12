//
//  MainTabView.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/22/24.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    
    private let authService: AuthService
    private let user: User
    
    
    init(authService: AuthService, user: User) {
        self.authService = authService
        self.user = user
    }
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            FeedView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Feed")
                    }
                }.tag(0)
            
            
            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.2")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Friends")
                    }
                }.tag(1)
            
            MediaSelectorView()
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
                    }
                }
                .onAppear() {
                    selectedTab = 2
                }
                .tag(2)
            
            NotificationsView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("Notifications")
                    }
                }.tag(3)
            
            CurrentUserProfileView(authService: authService, user: user)
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                        Text("Profile")
                    }
                }.tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView(authService: AuthService(), user: DeveloperPreview.user)
}
