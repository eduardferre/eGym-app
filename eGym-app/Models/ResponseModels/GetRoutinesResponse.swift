//
//  GetRoutinesResponse.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 28/1/24.
//

import Foundation

struct GetRoutinesTOResponse: Codable {
    var id: String
    var creator: String
    var name: String
    var description: String
    var exercises: [ExerciseTOModel]
    
    private enum CodingKeys: String, CodingKey {
        case id, creator, name, description, exercises
    }
}
