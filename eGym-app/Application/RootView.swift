//
//  RootView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 25/1/24.
//

import SwiftUI
import Foundation

struct RootView: View {
    @EnvironmentObject var auth: Auth
    @State var isFirstTime: Bool = true
    
    var body: some View {
        let noView: EmptyView = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isFirstTime = false
            }
            return EmptyView()
        }()
        noView
        
        if isFirstTime {
            LoadingView()
        } else {
            if auth.isLoggedIn {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    RootView()
}
