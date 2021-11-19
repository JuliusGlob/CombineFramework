//
//  ViewController.swift
//  CombineInUIKit
//
//  Created by Julio Ismael Robles on 18/11/2021.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    private var webservice: WebService = WebService()
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPublisher()
    }
    
    private func setupPublisher() {
        /// who is the publisher acting on and what events will it register?
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self.cityTextField)
        ///compactmap will only give use the values that are not nil
        self.cancellable = publisher.compactMap {
            ///this will be of type notification, we want the object within and return its text
            ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            ///debounce delays the event
        }.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
        ///flatmap will return a publisher in which we can access the city
        .flatMap { city in
            return self.webservice.fetchWeather(city: city)
                ///if there is some issue catch the problem
                .catch { _ in Just(Weather.placeholder) }
                ///then map the weather and do any conversions that need to be done
                .map { $0 }
        }.sink {
            if let temp = $0.temp {
            self.temperatureLabel.text = "\(temp)°"
            } else {
                self.temperatureLabel.text = "Enter a valid city"
            }
        }
    }
}

