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
    @State var toasting = false
    
    @Binding var addViewShowing: Bool
    
    let routines = [CustomData(name: "Leg Day"),
                    CustomData(name: "Pull Day"),
                    CustomData(name: "Press Day"),
                    CustomData(name: "Pull Day"),
                    CustomData(name: "Press Day"),
                    CustomData(name: "Leg Day"),
                    CustomData(name: "Pull Day"),
                    CustomData(name: "Press Day"),
                    CustomData(name: "Pull Day"),
                    CustomData(name: "Press Day")]
    
    let exercises = [CustomData(name: "Squats"),
                     CustomData(name: "Deadlifts"),
                     CustomData(name: "Bench Press"),
                     CustomData(name: "Lat Pulldowns"),
                     CustomData(name: "Overhead Press"),
                     CustomData(name: "Lunges"),
                     CustomData(name: "Rows"),
                     CustomData(name: "Incline Press"),
                     CustomData(name: "Chin-ups"),
                     CustomData(name: "Military Press"),
                     CustomData(name: "Leg Curls"),
                     CustomData(name: "Tricep Dips"),
                     CustomData(name: "Hammer Curls"),
                     CustomData(name: "Calf Raises"),
                     CustomData(name: "Plank"),
                     CustomData(name: "Russian Twists"),
                     CustomData(name: "Leg Extensions")]
    
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
                            ForEach(routines) { routine in
                                HStack {
                                    Text(routine.name)
                                        .foregroundStyle(Color("BrokenWhiteApp"))
                                        .frame(alignment: .leading)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color("BrokenWhiteApp"))
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
                            ForEach(exercises) { exercise in
                                HStack {
                                    Text(exercise.name)
                                        .foregroundStyle(Color("BrokenWhiteApp"))
                                        .frame(alignment: .leading)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color("BrokenWhiteApp"))
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
        }
    }
}

#Preview {
    InventoryView(addViewShowing: .constant(false))
}
