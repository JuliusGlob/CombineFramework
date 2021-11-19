//
//  Constants.swift
//  CombineInUIKit
//
//  Created by Julio Ismael Robles on 18/11/2021.
//

import Foundation

struct Constants {
    
    struct URLs {
        static let apiKey: String = "appid=Enter an openweather apikey here"
        static func weather(city: String) -> String {
            
            return "https://api.openweathermap.org/data/2.5/weather?q=\(city)&\(Constants.URLs.apiKey)&units=metric"
        }
    }
}
