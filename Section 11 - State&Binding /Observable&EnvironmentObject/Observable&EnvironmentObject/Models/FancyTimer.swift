//
//  FancyTimer.swift
//  Observable&EnvironmentObject
//
//  Created by Julio Ismael Robles on 19/11/2021.
//

import Foundation
import SwiftUI
import Combine

class FanctyTimer: ObservableObject {
    
    @Published var value: Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value += 1
        }
    }
    
}
