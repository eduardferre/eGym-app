//
//  AddExerciseListViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 29/1/24.
//


import Foundation

class AddExerciseListViewModel: ObservableObject {
    @Published var exerciseViewModels: [AddExerciseViewModel] = []

    init() {
        // Initialize with a default exercise view model
        exerciseViewModels.append(AddExerciseViewModel())
    }
}
