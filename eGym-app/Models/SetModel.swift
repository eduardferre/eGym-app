//
//  SetModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 14/2/24.
//

import Foundation

struct SetModel: Codable {
    var id: String
    var weight: Float
    var reps: Float
    var rpe: Int32
    var rir: Int32
    var restTime: Int32
    
    private enum CodingKeys: String, CodingKey {
        case id, weight, reps, rpe, rir, restTime
    }
    
}
