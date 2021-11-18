//
//  Webservice.swift
//  CombineFetchAndDisplay
//
//  Created by Julio Ismael Robles on 18/11/2021.
//

import Foundation
import Combine

class Webservice {
    
    func getPosts() -> AnyPublisher<[Post],Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            ///very important here, establish that the data will be recceived on the main thread.
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    
    }
}
