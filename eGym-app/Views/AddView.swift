//
//  AddView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 28/1/24.
//

import SwiftUI

struct AddView: View {
    
    @StateObject private var addExerciseListViewModel = AddExerciseListViewModel()
    @StateObject private var addViewModel = AddViewModel()
    
    @Binding var addViewShowing: Bool
    @State private var selection = "Select an option to create"
    @State private var views: [String] = []
    
    @StateObject var inventoryViewModel = InventoryViewModel()
    @State var multiSelection: [GetExercisesTOResponse] = []
    @State var listExercices: [GetExercisesTOResponse] = []
    
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
                            
                            
                            
                            if selection == "Routine" {
                                VStack {
                                    ForEach(addExerciseListViewModel.exerciseViewModels.indices, id: \.self) { index in
                                        AddRoutineView(addRoutineViewModel: addViewModel.routinesViewModel[index]).padding(.bottom, 5)
                                    }.onAppear {
                                        listExercices = inventoryViewModel.exercisesList
                                    }
                                        
                                    
                                    Text("Exercises")
                                        .bold()
                                        .foregroundStyle(Color("GoldApp"))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 30)
                                    
                                    NavigationView {
                                        List {
                                            ForEach(listExercices, id: \.self) { exercise in
                                                MultipleSelectionRow(title: exercise.name, isSelected: self.multiSelection.contains(exercise)) {
                                                    if self.multiSelection.contains(exercise) {
                                                        self.multiSelection.removeAll(where: { $0 == exercise })
                                                        
                                                    } else {
                                                        self.multiSelection.append(exercise)
                                                    }
                                                }
                                            }
                                        }
                                        .background(Color("BrownApp"))
                                        .foregroundStyle(Color("GoldApp"))
                                        .scrollContentBackground(.hidden)
                                    }
                                }
                                
                            } else if selection == "Exercise" {
                                ForEach(addExerciseListViewModel.exerciseViewModels.indices, id: \.self) { index in
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
                                if (selection == "Exercise") {
                                    Task {
                                        await addExerciseListViewModel.addExercisesToDB()
                                    }
                                } else if (selection == "Routine") {
                                    Task {
                                        await addViewModel.addRoutineToDB(exercices: listExercices)
                                    }
                                }
                                self.addViewShowing = false
                            }
                    }
                }
                .background(Color("BrownApp"))
                .onAppear {
                    Task {
                        await inventoryViewModel.getExercisesTO()
                    }
                }
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
