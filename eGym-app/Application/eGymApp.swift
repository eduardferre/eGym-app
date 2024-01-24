//
//  eGym_appApp.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 30/12/23.
//

import SwiftUI

@main
struct eGym: App {
    @StateObject var auth = Auth()
    
    var body: some Scene {
        WindowGroup {
            if auth.isLoggedIn {
                MainView()
                    .environmentObject(auth)
            } else {
                LoginView()
                    .environmentObject(auth)
            }
        }
    }
}
