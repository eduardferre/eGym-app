//
//  AddRoutineViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 13/2/24.
//

import Foundation

class AddRoutineViewModel: ObservableObject {
    @Published var routineName = ""
    @Published var routineDescription = ""
    @Published var routineExercises: [GetExercisesTOResponse] = []
    
}
