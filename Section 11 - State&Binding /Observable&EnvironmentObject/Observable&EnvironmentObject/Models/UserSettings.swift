//
//  UserSettings.swift
//  Observable&EnvironmentObject
//
//  Created by Julio Ismael Robles on 19/11/2021.
//

import Foundation
import SwiftUI
import Combine

class UserSettings: ObservableObject {
    
    @Published var score: Int = 0
    
}
