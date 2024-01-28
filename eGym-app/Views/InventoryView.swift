//
//  AddView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 27/1/24.
//

import SwiftUI
import AlertToast

struct CustomData: Identifiable {
    let id = UUID()
    var name: String
}

struct InventoryView: View {
    @StateObject var inventoryViewModel = InventoryViewModel()
    @State var toasting = false
    
    @Binding var addViewShowing: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .frame(width: 56, height: 56)
                                .foregroundStyle(Color("BrownApp"))
                            Image(systemName: "square.and.pencil.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 56, height: 56)
                                .foregroundStyle(Color("GoldApp"))
                                .onTapGesture {
                                    self.addViewShowing = true
                                }
                        }.padding(.trailing, 20)
                            .padding(.bottom, 20)
                    }
                }.zIndex(2)
                
                VStack {
                    List {
                        Section(header: Text("Routines")
                            .foregroundStyle(Color("GoldApp"))
                            .bold()
                        ) {
                            if inventoryViewModel.routinesList.isEmpty {
                                Text("There are no routines yet!")
                            }
                            ForEach($inventoryViewModel.routinesList, id: \.id) { $routine in
                                HStack {
                                    Text($routine.wrappedValue.name)
                                        .foregroundStyle(Color.white)
                                        .frame(alignment: .leading)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color.white)
                                        .frame(alignment: .trailing)
                                }.contentShape(Rectangle())
                                    .onTapGesture {
                                        toasting.toggle()
                                    }
                            }
                        }.listRowBackground(Color("BrownApp-Light"))
                        
                        Section(header: Text("Exercises")
                            .foregroundStyle(Color("GoldApp"))
                            .bold()
                        ) {
                            if inventoryViewModel.exercisesList.isEmpty {
                                Text("There are no exercises yet!")
                            }
                            ForEach($inventoryViewModel.exercisesList, id: \.id) { $exercise in
                                HStack {
                                    Text($exercise.wrappedValue.name)
                                        .foregroundStyle(Color.white)
                                        .frame(alignment: .leading)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color.white)
                                        .frame(alignment: .trailing)
                                }.contentShape(Rectangle())
                                    .onTapGesture {
                                        toasting.toggle()
                                    }
                            }
                        }.listRowBackground(Color("BrownApp-Light"))
                    }.scrollContentBackground(.hidden)
                }.background(Color("BrownApp"))
                    .toast(isPresenting: $toasting) {
                        AlertToast(displayMode: .alert, type: .systemImage("exclamationmark.triangle.fill", Color.yellow), title: "NOT IMPLEMENTED YET")
                    }
            }
        }.onAppear {
            Task {
                await inventoryViewModel.getRoutinesTO()
                await inventoryViewModel.getExercisesTO()
            }
        }
    }
}

#Preview {
    InventoryView(addViewShowing: .constant(false))
}
