//
//  ContentView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 30/12/23.
//

import SwiftUI

struct MainView: View {
    @State private var isLoading = true
    @State var addViewShowing = false
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        let noView: EmptyView = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                //TODO: FETCH DATA
                isLoading = false
            }
            return EmptyView()
        }()
        noView
        
        if isLoading {
            LoadingView()
        } else {
            if addViewShowing {
                AddView(addViewShowing: $addViewShowing).onAppear(perform: {
                    selectedTab = 2
                })
            } else {
                VStack {
                    ToolBarView()
                    TabView(selection: $selectedTab)
                    {
                        Group {
                            HomeView()
                                .tabItem {
                                    Label("Home", systemImage: "house")
                                }.tag(0)
                            
                            SearchView()
                                .tabItem {
                                    Label("Search", systemImage: "magnifyingglass")
                                }.tag(1)
                            
                            InventoryView(addViewShowing: $addViewShowing)
                                .tabItem {
                                    Label("Add", systemImage: "note")
                                }.tag(2)
                            
                            CalendarView()
                                .tabItem {
                                    Label("Calendar", systemImage: "calendar")
                                }.tag(3)
                            
                            UploadVideoView()
                                .tabItem {
                                    Label("Video", systemImage: "video")
                                }.tag(4)
                        }.toolbarBackground(Color("BrownApp"), for: .tabBar)
                            .toolbarBackground(.visible, for: .tabBar)
                        
                    }.tint(Color("GoldApp"))
                }.background(Color("BrownApp"))
            }
        }
    }
}

#Preview {
    MainView()
}
