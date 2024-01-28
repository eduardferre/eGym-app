//
//  prova.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 27/1/24.
//

import SwiftUI

struct prova: View {
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
                AddView()
                    .tabItem {
                        Label("Add", systemImage: "note")
                    }
                
                CalendarView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                
                UploadVideoView()
                    .tabItem {
                        Label("Video", systemImage: "video")
                    }
            }.toolbarBackground(Color("BrownApp"), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            
        }.tint(Color("GoldApp"))
    }
}

#Preview {
    prova()
}
