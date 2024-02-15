//
//  CommentModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 13/2/24.
//

import Foundation

struct CommentModel: Codable {
    var id: String
    var postId: String
    var creator: String
    var content: String
    
    private enum CodingKeys: String, CodingKey {
        case id, postId, creator, content
    }
}
