//
//  TabBarView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 26/1/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case magnifyingglass
    case note
    case calendar
    case video
}

struct TabBarView: View {
    @Binding var selectedTab: Tab
//    var fillImage: String {
//       selectedTab.rawValue + ".fill"
//    }
    var tabColor = Color("GoldApp")


    var body: some View {
       VStack {
           HStack {
               ForEach(Tab.allCases, id: \.rawValue) { tab in
                   Spacer()
                   Image(systemName: tab.rawValue)
                       .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                       .foregroundColor(tab == selectedTab ? tabColor : .gray)
                       .font(.system(size: 20))
                       .onTapGesture {
                           withAnimation(.easeInOut(duration: 0.1)) {
                               selectedTab = tab
                           }
                       }
                   Spacer()
               }
           }
           .frame(width: nil, height: 60)
           .background(.thinMaterial)
       }
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.house))
}
