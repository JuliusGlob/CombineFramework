//
//  Story.swift
//  HackerNews
//
//  Created by Julio Ismael Robles on 22/11/2021.
//

import Foundation

struct Story: Codable {
    
    let id: Int
    let title: String
    let url: String
    
}

extension Story {
    static func placeholder() -> Story {
        return Story(id: 0, title: "", url: "")
    }
}
