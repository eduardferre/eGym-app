//
//  AddViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 29/1/24.
//

import Foundation

class AddViewModel: ObservableObject {
    @Published var routinesViewModel: [AddRoutineViewModel] = []
    
    @Published var errorMsg = ""
    @Published var hasFailed = false
    init() {
        // Initialize with a default exercise view model
        routinesViewModel.append(AddRoutineViewModel())
    }
    
    private func createAddRoutine(request: RoutineTOModel) async {
        await UserTOServices.shared.callAddRoutine(parameters: request.dictionary ?? [:]) { response in
            if response != nil {
                self.errorMsg = ""
            }
        } failure: { error in
            self.errorMsg = error.responseCode == 401 ? "Unauthorized!" : "Ooops! There's a problem, sorry!"
            self.hasFailed = true
        }
    }
    
    public func addRoutineToDB(exercices: [GetExercisesTOResponse]) async {
        let routineTO: RoutineTOModel = RoutineTOModel(id: "", creator: Auth.shared.getUsername()!, name: routinesViewModel[0].routineName, description: routinesViewModel[0].routineDescription,  exercises: exercices)
        
        await createAddRoutine(request: routineTO)
        
    }
}
