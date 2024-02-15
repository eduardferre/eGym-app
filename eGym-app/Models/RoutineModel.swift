//
//  RoutineModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 14/2/24.
//

import Foundation

struct RoutineModel: Codable {
    var id: String
    var creator: String
    var name: String
    var description: String
    var exercises: [ExerciseModel]
    var liftedWeight: Float
    var date: String
    
    private enum CodingKeys: String, CodingKey {
        case id, creator, name, description, exercises, liftedWeight, date
    }
}
