//
//  Photo.swift
//  Navigation
//
//  Created by Semyon on 12.08.2022.
//

import Foundation

struct Photo {
    let name: String
}

extension Photo {
    
    static func make() -> [Photo] {
        [
            Photo(name: "pic1"),
            Photo(name: "pic2"),
            Photo(name: "pic3"),
            Photo(name: "pic4"),
            Photo(name: "pic5"),
            Photo(name: "pic6"),
            Photo(name: "pic7"),
        ]
    }
}
