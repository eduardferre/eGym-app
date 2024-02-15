//
//  PostModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 13/2/24.
//

import Foundation

struct PostModel: Codable {
    var id: String
    var creator: String
    var url: String
    var caption: String
    var likes: Int32
    var comments: [CommentModel]
    var creationDate: String
    
    private enum CodingKeys: String, CodingKey {
        case id, creator, url, caption, likes, comments, creationDate
    }
}
