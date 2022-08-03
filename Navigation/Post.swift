//
//  Post.swift
//  Navigation
//
//  Created by Semyon on 10.07.2022.
//

import Foundation


struct Post {
    let author: String
    let description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Porta lorem mollis aliquam ut porttitor leo. Fermentum odio eu feugiat pretium nibh ipsum consequat nisl."
    let image: String
    let likes: Int
    let views: Int
}


extension Post {
    
    static func make() -> [Post] {
        [
            Post(author: "Lorem ipsum A", image: "640x640", likes: 1, views: 2),
            Post(author: "Lorem ipsum B", image: "640x480", likes: 3, views: 4),
            Post(author: "Lorem ipsum C", image: "480x640", likes: 5, views: 6),
            Post(author: "Lorem ipsum D", image: "640x640", likes: 7, views: 8),
        ]
    }
}
