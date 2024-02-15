//
//  AddExerciseListViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 29/1/24.
//


import Foundation

class AddExerciseListViewModel: ObservableObject {
    @Published var exerciseViewModels: [AddExerciseViewModel] = []
    
    @Published var errorMsg = ""
    @Published var hasFailed = false
    init() {
        // Initialize with a default exercise view model
        exerciseViewModels.append(AddExerciseViewModel())
    }
    
    private func createAddExercise(request: ExerciseTOModel) async {
        await UserTOServices.shared.callAddExercise(parameters: request.dictionary ?? [:]) { response in
            if response != nil {
                self.errorMsg = ""
            }
        } failure: { error in
            self.errorMsg = error.responseCode == 401 ? "Unauthorized!" : "Ooops! There's a problem, sorry!"
            self.hasFailed = true
        }
    }
    
    public func addExercisesToDB() async {
        for exercise in exerciseViewModels {
            let exerciseTO: ExerciseTOModel = ExerciseTOModel(id: "", creator: Auth.shared.getUsername()!, name: exercise.exerciseName, description: exercise.exerciseDescription)
            
            await createAddExercise(request: exerciseTO)
        }
    }
}
