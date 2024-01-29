//
//  AddView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 28/1/24.
//

import SwiftUI

struct AddView: View {
    @StateObject private var addExerciseListViewModel = AddExerciseListViewModel()
    
    @Binding var addViewShowing: Bool
    @State private var selection = "Select an option to create"
    @State private var views: [String] = []
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    ScrollViewReader { scrollView in
                        ScrollView {
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
                                .padding(.bottom, 20)
                                .foregroundStyle(Color("GoldApp"))
                                .bold()
                            
                            ForEach(addExerciseListViewModel.exerciseViewModels.indices, id: \.self) {index in
                                if index > 0 {
                                    Divider().background(Color("BrokenWhiteApp"))
                                }
                                    Text("Exercise \(index + 1)")
                                        .bold()
                                        .foregroundStyle(Color("GoldApp"))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 30)
                                    AddExerciseView(addExerciseViewModel: addExerciseListViewModel.exerciseViewModels[index]).padding(.bottom, 5)
                            }
                            
                            HStack {
                                Button(action: {
                                    addView()
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20.0)
                                            .foregroundColor(Color("GoldApp"))
                                        Text("Add another one")
                                            .foregroundColor(Color.white)
                                            .bold()
                                    }
                                })
                                .frame(width: UIScreen.main.bounds.width * 0.45, height: 60)
                                Button(action: {
                                    deleteView()
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20.0)
                                            .foregroundColor(Color.red.opacity(0.8))
                                        Text("Delete Exercise")
                                            .foregroundColor(Color.white)
                                            .bold()
                                    }
                                }).disabled(addExerciseListViewModel.exerciseViewModels.count == 1)
                                .frame(width: UIScreen.main.bounds.width * 0.45, height: 60)
                            }.id(10)
                            
                            if selection == "Routine" {
                                AddRoutineView()
                            } else if selection == "Exercise" {
                                AddExerciseView()
                            }
                            
                        }.onChange(of: addExerciseListViewModel.exerciseViewModels.count) {
                            // Scroll to the bottom when messages change
                            withAnimation {
                                scrollView.scrollTo(10)
                            }
                        }
                    }
                    
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
                    ToolbarItem(placement: .topBarTrailing) {
                        Text("ADD")
                            .bold()
                            .foregroundStyle(Color("GoldApp")).frame(alignment: .trailing)
                            .onTapGesture {
                                print(addExerciseListViewModel.exerciseViewModels.first?.exerciseName)
                                self.addViewShowing = false
                            }
                    }
                }.background(Color("BrownApp"))
            }
        }
    }
    
    private func addView() {
        addExerciseListViewModel.exerciseViewModels.append(AddExerciseViewModel())
    }
    
    private func deleteView() {
        addExerciseListViewModel.exerciseViewModels.removeLast()
    }
}

#Preview {
    AddView(addViewShowing: .constant(true))
}
