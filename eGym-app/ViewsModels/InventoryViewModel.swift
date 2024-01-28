//
//  InventoryViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 28/1/24.
//

import Foundation


class InventoryViewModel: ObservableObject {
    @Published var routinesList: [GetRoutinesTOResponse] = []
    @Published var exercisesList: [GetExercisesTOResponse] = []
    
    @Published var errorMsg = ""
    @Published var hasFailed = false
    
    func getRoutinesTO() async {
        await UserTOServices.shared.callGetRoutinesByCreator() { response in
            if let response = response {
                self.errorMsg = ""
                self.routinesList = response
            }
        } failure: { error in
            self.errorMsg = "Oops! There's a problem, sorry!"
            self.hasFailed = true
        }
    }
    
    func getExercisesTO() async {
        await UserTOServices.shared.callGetExercisesByCreator() { response in
            if let response = response {
                self.errorMsg = ""
                self.exercisesList = response
            }
        } failure: { error in
            self.errorMsg = "Oops! There's a problem, sorry!"
            self.hasFailed = true
        }
    }
}
