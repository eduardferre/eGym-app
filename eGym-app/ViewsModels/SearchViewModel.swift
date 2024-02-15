//
//  SearchViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 14/2/24.
//

import Foundation

struct Tag: Identifiable {
    var id = UUID().uuidString
    var name: String
    var isSelected: Bool = false
}

class SearchViewModel: ObservableObject {
    @Published var tags: [Tag] = [Tag(name: "Users"), Tag(name: "Exercises"), Tag(name: "Routines")]

    @Published var hasTimeElapsed = false
    @Published var delaying = false
    @Published var user: UserModel!
    @Published var exercise: ExerciseTOModel!
    @Published var routines: [RoutineTOModel] = []
    
    @Published var nothingSelected = false
    @Published var searchText = ""
    @Published var errorMsg = ""
    @Published var hasFailed = false
    
    
    func delay() async {
            let userTag = tags.first(where: { $0.name == "Users" })
            let exerciseTag = tags.first(where: { $0.name == "Exercises" })
            let routineTag = tags.first(where: { $0.name == "Routines" })
            
            print("Searching...")
            if (userTag?.isSelected == true) {
                print("Users...")
                await getUsers()
            }
            if (exerciseTag?.isSelected == true) {
                print("Exercises...")
                await getExercises()
            }
            if (routineTag?.isSelected == true) {
                print("Routines...")
                await getRoutines()
            }
            if (userTag?.isSelected == false && exerciseTag?.isSelected == false && routineTag?.isSelected == false) {
                print("Nothing selected!")
                nothingSelected = true
            }
    }
    
    func getUsers() async {
        await UserTOServices.shared.callGetUserByUsername(username: searchText) { response in
            if let response = response {
                self.errorMsg = ""
                self.user = response
            }
        } failure: { error in
            self.errorMsg = "Oops! There's a problem, sorry!"
            self.hasFailed = true
        }
    }
    
    func getExercises() async {
        await UserTOServices.shared.callGetExerciseTOByName(exerciseName: searchText) { response in
            if let response = response {
                self.errorMsg = ""
                self.exercise = response
            }
        } failure: { error in
            self.errorMsg = "Oops! There's a problem, sorry!"
            self.hasFailed = true
        }
    }
    
    func getRoutines() async {
        await UserTOServices.shared.callGetRoutinesByName(routineName: searchText) { response in
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
