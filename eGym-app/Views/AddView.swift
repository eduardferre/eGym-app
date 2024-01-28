//
//  AddView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 28/1/24.
//

import SwiftUI

struct AddView: View {
    @Binding var addViewShowing: Bool
    @State private var selection = "Select an option to create"
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    Menu {
                        Button {
                            selection = "Routine"
                            
                        } label: {
                            Text("Routine")
                            Image(systemName: "text.badge.plus")
                        }
                        Button {
                            selection = "Exercise"
                            
                        } label: {
                            Text("Exercise")
                            Image(systemName: "text.badge.plus")
                        }
                    } label: {
                        Image(systemName: selection == "Routine" || selection == "Exercise" ? "dumbbell.fill" : "chevron.down")
                        Text(selection)
                        Image(systemName: selection == "Routine" || selection == "Exercise" ? "dumbbell.fill" : "chevron.down")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .foregroundStyle(Color("GoldApp"))
                        .bold()
                    
                    
                    
                    Spacer()
                }.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack {
                            HStack {
                                Image(systemName: "arrow.left").foregroundStyle(Color("GoldApp"))
                                Text("Back").foregroundStyle(Color("GoldApp"))
                            }.onTapGesture {
                                print("si")
                                self.addViewShowing = false
                            }
                        }
                    }
                }.background(Color("BrownApp"))
            }
        }
    }
}

#Preview {
    AddView(addViewShowing: .constant(true))
}
