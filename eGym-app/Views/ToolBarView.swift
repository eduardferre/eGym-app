//
//  ToolBarView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 26/1/24.
//

import SwiftUI

struct ToolBarView: View {
    var body: some View {
        VStack {
            HStack {
                Image("avatar").resizable().aspectRatio(contentMode: .fit).frame(maxWidth: .infinity, maxHeight: 56, alignment: .leading).padding(.leading, 10)
                Image("eGym-ToolBar").resizable().aspectRatio(contentMode: .fit).frame(maxWidth: .infinity, maxHeight: 56, alignment: .center)
                HStack {
                    Image(systemName: "bell").resizable().aspectRatio(contentMode: .fit).frame(height: 20).foregroundStyle(Color("BrokenWhiteApp")).padding(.trailing, 5)
                    Image(systemName: "gearshape").resizable().aspectRatio(contentMode: .fit).frame(height: 20).foregroundStyle(.white).padding(.trailing, 15)
                        .onTapGesture {
                            Auth.shared.logout()
                        }
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 56, alignment: .trailing)
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(Color("BrownApp-Dark"))
        }
    }
}
#Preview {
    ToolBarView()
}
