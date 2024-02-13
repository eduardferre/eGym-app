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
    
    init(feed: [Post]) {
       self.feed = feed
   }
   
   let feed: [Post]
    
    var body: some View {
        NavigationStack {
            List(feed, id: \.author.nickname, rowContent: { post in
                VStack(alignment: .leading) {
                    
                    HStack {
                        Image(uiImage: post.author.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .clipped()
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(post.author.nickname)
                                .fontWeight(.bold)
                                .font(.footnote)
                            Text("Italy")
                                .font(.caption)
                        }
                    }
                    
                    Image(uiImage: post.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 220)
                        .clipped()
                        .padding([.leading, .trailing], -20)
                    
                    HStack {
                        Group {
                            Image(systemName: "heart")
                            Image(systemName: "bubble.right")
                            Image(systemName: "paperplane")
                        }
                        .padding(.trailing, 5)
                        Spacer()
                        Image(systemName: "bookmark")
                    }
                    .font(.callout)
                    .padding([.top, .bottom], 6)
                    
                    Group {
                        Text(post.author.nickname)
                            .fontWeight(.bold)
                        +
                        Text(" ")
                        +
                        Text(post.description)
                    }
                    .font(.caption)
                    .lineLimit(2)
                    
                }
                .padding(.bottom, 10)
            })
        }
    }
}

#Preview {
    HomeView(feed: Post.mocks())
}
