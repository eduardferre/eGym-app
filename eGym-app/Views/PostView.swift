//
//  PostView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 13/2/24.
//

import SwiftUI

struct PostView: View {
    @Binding var postModel: PostModel
    
    @State var liked = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipped()
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(postModel.creator)
                        .fontWeight(.bold)
                        .font(.footnote)
                }
            }
            
            AsyncImage(
                url: URL(string: postModel.url),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            HStack {
                Group {
                    LikeView(isLiked: $liked)
                        .onTapGesture {
                            liked.toggle()
                        }
                    Image(systemName: "bubble.right")
                }
                .padding(.leading, 6)
            }
            .font(.system(size: 20))
            .padding([.top, .bottom], 2)
            
            VStack {
                Text(String(postModel.likes) + " likes")
                    .font(.caption)
            }.padding(.leading, 8)
            
            VStack {
                Group {
                    Text(postModel.creator)
                        .fontWeight(.bold)
                    +
                    Text(" ")
                    +
                    Text(postModel.caption)
                }
                .font(.caption)
                .lineLimit(2)
            }.padding(.leading, 8)
            
        }
        .padding(.bottom, 10)
        .background(Color("BrownApp"))
    }
}

#Preview {
    PostView(postModel: .constant(PostModel(id: "1234", creator: "eduardferre", url: "https://www.shutterstock.com/image-photo/funny-pet-dog-playing-orange-260nw-462669349.jpg", caption: "This is my first post!", likes: 10, comments: [], creationDate: "...")))
}


struct LikeView: View {
  @State private var pinkBorder: Bool = false
  @State private var opacity: CGFloat = 0.0
  @State private var scaleHeart: CGFloat = 0.0
  @State private var scaleText: CGFloat = 1
  @Binding var isLiked: Bool
  
  var body: some View {
    ZStack {
        VStack {
            ZStack {
                Image(systemName: "heart")
                    .font(.system(size: 20))
                    .foregroundColor(pinkBorder ? .pink : .white)
                
//                Image(systemName: "heart")
//                    .font(.system(size: 20))
//                    .foregroundColor(pinkBorder ? .pink : .white)
//                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 10).delay(0.25))
                
                Image(systemName: "heart.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.pink)
                    .scaleEffect(scaleHeart)
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 10).delay(0.25))
            }
            .onTapGesture {
                isLiked.toggle()
                pinkBorder.toggle()
                opacity += 1
                scaleHeart += 1
                scaleText = 1.2
                if !isLiked {
                    pinkBorder = false
                    scaleHeart = 0
                    isLiked = false
                    scaleText = 1
                }
            }
        }
    }
  }
}
