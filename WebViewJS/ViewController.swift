//
//  ViewController.swift
//  WebViewJS
//
//  Created by natalie on 10/29/14.
//  Copyright (c) 2014 Natalie Podrazik. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController {

    let manager = AFHTTPRequestOperationManager()
    let weatherAPIEndpoint = "http://api.openweathermap.org/data/2.5/weather"
    var latitude: Double = 40.7237692
    var longitude: Double = -74.0004012
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.manager.GET(self.weatherAPIEndpoint + "?lat=\(self.latitude)&long=(self.longitude)", parameters: nil, success: (operation, response) -> Void on
            
                // success
            , failure: (request, error) -> Void on
            
            // failure
        )
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

