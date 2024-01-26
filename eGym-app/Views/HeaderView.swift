//
//  HeaderView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 26/1/24.
//

import SwiftUI

struct HeaderView: View {
    var height: CGFloat
    
    var body: some View {
        ZStack {
            Image("eGym")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: height)
        }.offset(y: -20)
    }
}

#Preview {
    HeaderView(height: 300)
}
