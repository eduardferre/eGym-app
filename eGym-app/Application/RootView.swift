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
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some View {
        if $rootViewModel.isFirstTime.wrappedValue {
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

class RootViewModel: ObservableObject {
    @Published var isFirstTime: Bool = true
    
    func setFalse() {
        isFirstTime = false
    }
}
