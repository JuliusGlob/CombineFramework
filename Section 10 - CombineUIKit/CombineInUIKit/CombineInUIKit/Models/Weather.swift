//
//  Weather.swift
//  CombineInUIKit
//
//  Created by Julio Ismael Robles on 18/11/2021.
//

import Foundation

struct WeatherResponse: Decodable {
    
    let main: Weather
    
}

struct Weather: Decodable {
    
    let temp: Double?
    let humidity: Double?
    
    ///this placeholder will be used to failsafe update the ui
    static var placeholder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
    
}


