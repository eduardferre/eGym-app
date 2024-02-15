//
//  HomeView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 27/1/24.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        let noView: EmptyView = {
            if (homeViewModel.listPosts.isEmpty) {
                Task {
                    await homeViewModel.getPosts()
                }
            }
            return EmptyView()
        }()
        noView
        
        VStack {
            ScrollViewReader { scrollView in
                ScrollView {
                    if (!homeViewModel.listPosts.isEmpty) {
                        ForEach(homeViewModel.listPosts.indices, id: \.self) { index in
                            Divider().background(Color("BrokenWhiteApp"))
                            PostView(postModel: $homeViewModel.listPosts[index])
                        }
                    }
                }
            }
        }.background(Color("BrownApp"))
    }
}


#Preview {
    HomeView()
}
