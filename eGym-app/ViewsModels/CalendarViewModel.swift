//
//  CalendarViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 14/2/24.
//

import Foundation

class CalendarViewModel: ObservableObject {
    @Published var routines: [RoutineModel] = []
    
    @Published var hasFailed = false
    @Published var errorMsg = ""
    
    func getRoutines() async {
        await RoutineServices.shared.callGetRoutinesByCreator() { response in
            if let response = response {
                self.errorMsg = ""
                self.routines = response
            }
        } failure: { error in
            self.errorMsg = "Oops! There's a problem, sorry!"
            self.hasFailed = true
        }
    }
}
