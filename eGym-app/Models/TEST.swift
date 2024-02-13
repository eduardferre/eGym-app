//
//  TEST.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 13/2/24.
//

import Foundation
import UIKit

struct Post {
    let description: String
    let image: UIImage
    let author: Author
}

struct Author {
    let nickname: String
    let image: UIImage
}


#if DEBUG

extension Post {
    static func mocks() -> [Post] {
        [
            Post(
                description: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?",
                image: #imageLiteral(resourceName: "eGym"),
                author: Author(nickname: "Tahlia Cuevas", image: #imageLiteral(resourceName: "avatar"))),
            Post(
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                image: #imageLiteral(resourceName: "eGym"),
                author: Author(nickname: "Eddie Berry", image: #imageLiteral(resourceName: "avatar"))),
            Post(
                description: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.",
                image: #imageLiteral(resourceName: "eGym-ToolBar"),
                author: Author(nickname: "Susan Montes", image: #imageLiteral(resourceName: "avatar")))
        ]
    }
}

#endif
