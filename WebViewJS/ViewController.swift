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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.loadHTML()
        
        self.loadSunCalcJS()
    }
    
    /*
    func loadHTML() {
        // load html from file...
        var htmlFile = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        var error: NSError?
        var htmlString: String? = String(contentsOfFile:htmlFile!, encoding: NSUTF8StringEncoding, error: &error)
        
        self.webView.loadHTMLString(htmlString, baseURL: nil)
    }
    */
    
    func loadSunCalcJS() {
        // load html from file...
        var suncalcFile = NSBundle.mainBundle().pathForResource("suncalc", ofType: "js")
        var error: NSError?
        var suncalcJSString: String? = String(contentsOfFile:suncalcFile!, encoding: NSUTF8StringEncoding, error: &error)
        
        // evaluate the following js
        // var command = "var times = SunCalc.getTimes(new Date(), 51.5, -0.1);"
        //var command = "var date = new Date('2013-03-05UTC'), lat = 50.5, lng = 30.5;"
        var command = "function suncalc() { var result = SunCalc.getTimes(new Date(), 51.5, -0.1); return JSON.stringify(result); } suncalc();"
        
        
        var finalString: NSString = suncalcJSString! as NSString + "\n" + command as NSString
        
        println("full html: \n\(finalString)")

        self.webView = WKWebView()
        self.webView.loadHTMLString("<script type='text/javascript'>\(suncalcJSString!)</script>", baseURL: nil)
        
        self.webView!.evaluateJavaScript(command, completionHandler: { (value, error) in
            println("got value: \(value) error: \(error)")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

