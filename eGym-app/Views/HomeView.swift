//
//  HomeView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 27/1/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text("HOME")
                
                Button {
                    homeViewModel.logout()
                } label: {
                    Text("Log Out")
                    Image(systemName: "text.badge.plus")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
