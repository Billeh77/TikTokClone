//
//  TiktokkApp.swift
//  Tiktokk
//
//  Created by Emile Billeh on 12/22/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct TiktokkApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let authService = AuthService()
    private let userSercvie = UserService()
    
    var body: some Scene {
        WindowGroup {
            ContentView(authService: authService, userService: userSercvie)
        }
    }
}
