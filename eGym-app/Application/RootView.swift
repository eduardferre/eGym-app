//
//  RootView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 25/1/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var auth: Auth
    
    var body: some View {
        if auth.isLoggedIn {
            MainView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
}
