//
//  RoutineTOModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 13/2/24.
//

import Foundation

struct RoutineTOModel: Codable {
    var id: String
    var creator: String
    var name: String
    var description: String
    var exercises: [GetExercisesTOResponse]
    
    private enum CodingKeys: String, CodingKey {
        case id, creator, name, description, exercises
    }
}
