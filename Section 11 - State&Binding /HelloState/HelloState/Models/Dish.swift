//
//  Dish.swift
//  HelloState
//
//  Created by Julio Ismael Robles on 19/11/2021.
//

import Foundation
import SwiftUI

struct Dish: Identifiable {
    
    let id = UUID()
    let name: String
    let imageURL: String
    let isSpicy: Bool
    
}

extension Dish {
    
    static func all() -> [Dish] {
        return [
            Dish(name: "Choripan", imageURL: "choripan", isSpicy: true),
            Dish(name: "Hamburguesa", imageURL: "burger", isSpicy: false),
            Dish(name: "Tacos", imageURL: "tacos", isSpicy: true)
        ]
    }
    
}
