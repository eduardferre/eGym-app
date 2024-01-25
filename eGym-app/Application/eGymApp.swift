//
//  eGym_appApp.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 30/12/23.
//

import SwiftUI

@main
struct eGym: App {
    
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(Auth.shared)
        }
    }
}
