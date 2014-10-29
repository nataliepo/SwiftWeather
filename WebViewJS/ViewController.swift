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

    @IBOutlet var webView: WKWebView!

    // SoHo, NYC
    let latitude: Double = 40.7237692
    let longitude: Double = -74.0004012
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var timeZone = NSTimeZone.localTimeZone()

        //+(EDSunriseSet *)sunrisesetWithTimezone:(NSTimeZone *)timezone latitude:(double)lat longitude:(double)longt
        
        var sunriseSet:EDSunriseSet = EDSunriseSet.sunrisesetWithTimezone(timeZone, latitude:self.latitude, longitude:self.longitude)
        
        var sunriseDate = sunriseSet.sunrise
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mma"
        
        println("Sunrise time: \(dateFormatter.stringFromDate(sunriseDate!))")
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

