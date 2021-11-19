//
//  ViewController.swift
//  UsingDebugger
//
//  Created by Julio Ismael Robles on 18/11/2021.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let publisher = (1...10).publisher
        self.cancellable = publisher
            ///.breakpoint(many choices here, this case will break on receivedoutput)
            .breakpoint(receiveOutput: { $0 > 9 })
            //.breakpointOnError()// this will launch the debugger
            .sink {
            print($0)
        }
    }


}

