//
//  ExerciseModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 14/2/24.
//

import Foundation

struct ExerciseModel: Codable {
    var id: String
    var name: String
    var description: String
    var sets: [SetModel]
    var liftedWeight: Float
    var highestWeight: Float
    
    private enum CodingKeys: String, CodingKey {
        case id, name, description, sets, liftedWeight, highestWeight
    }
}
