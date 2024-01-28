//
//  ExerciseModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 28/1/24.
//

import Foundation

struct ExerciseTOModel: Codable {
    var id: String
    var creator: String
    var name: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case id, creator, name, description
    }
}
