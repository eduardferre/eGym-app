//
//  ContentView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 30/12/23.
//

import SwiftUI

struct MainView: View {
    @State private var isLoading = false
    @State private var tabSelected: Tab = .house
        
    init() {
        UITabBar.appearance().isHidden = true
    }
    
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
            ZStack {
                VStack {
                    ToolBarView()
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    TabBarView(selectedTab: $tabSelected)
                }
            }.background(Color("BrownApp"))
        }
    }
}

#Preview {
    MainView()
}
