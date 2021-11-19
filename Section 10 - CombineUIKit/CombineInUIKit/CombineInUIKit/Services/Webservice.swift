//
//  Webservice.swift
//  CombineInUIKit
//
//  Created by Julio Ismael Robles on 18/11/2021.
//

import Foundation
import Combine

class WebService {
    
    func fetchWeather(city: String) -> AnyPublisher<Weather,Error> {
        
        guard let url = URL(string: Constants.URLs.weather(city: city)) else {
            ///sorry for the fatalerrors, they wont be in development, they are just an easy handler for testing
            fatalError("Invalid URL, remember to add an apikey in the constants folder")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            ///why double map? we want only the Weather data, we dont need to use any other data received.
            .map { $0.main }
            /// Since we already learnt the hard way, send the response to whoever will receive it on the main thread.
            .receive(on: RunLoop.main)
            /// as mentioned in previous sections we want to have this response acomodate to any type of publisher.
            .eraseToAnyPublisher()
        
    }
}
