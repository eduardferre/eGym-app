//
//  LoadingView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 22/1/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var showSpinner:Bool = false
    @State private var degree:Int = 270
    @State private var spinnerLength = 0.6
    
    @State private var loadingText: String = ""
    
    public var body: some View {
        ZStack {
            VStack {
                HeaderView(height: 350).offset(y: 60)
                
                Circle()
                    .trim(from: 0.0,to: spinnerLength)
                    .stroke(LinearGradient(colors: [Color("GoldApp"), .yellow.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing),style: StrokeStyle(lineWidth: 10.0,lineCap: .round, lineJoin:.round))
                    .animation(Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true))
                    .frame(width: 120,height: 120)
                    .rotationEffect(Angle(degrees: Double(degree)))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .onAppear{
                        degree = 270 + 360
                        spinnerLength = 0
                    }.padding(.top, 60).padding(.bottom, 30)
                
                Text(loadingText)
                    .font(.system(size: 20))
                    .foregroundStyle(Color("GoldApp"))
                    .animation(Animation.linear(duration: 1).repeatForever())
                    .onAppear{
                        loadingText = ""
                        "Lifting weights...".enumerated().forEach { index, character in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                loadingText += String(character)
                            }
                        }
                    }
                
                Spacer()
                
                Text("©eSolutions - Eduard Ferré Sánchez")
                    .font(.system(size:10))
                    .foregroundStyle(Color("GoldApp"))
                
            }.background(Color("BrownApp"))
        }
    }
}

#Preview {
    LoadingView()
}
