//
//  ViewController.swift
//  ex00
//
//  Created by Kyle ROUTLEDGE on 2018/10/10.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO

class ViewController: UIViewController {

    var bot: RecastAIClient? = nil
     let client = DarkSkyClient(apiKey: "a6bda0c209b0daab9e03fdad6d65caef")
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bot = RecastAIClient(token: "ed6e3290f37e1baabdbe3036858aedda")
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestButton(_ sender: UIButton) {
        makeRequest(request: userInput.text!)
    }
    
    func makeRequest(request: String)
    {
        //Call makeRequest with string parameter to make a text request
        self.bot?.textRequest(request, successHandler: recastRequestDone(_:), failureHandle: recastRequestError(_:))
        
        
       
    }
    
    func recastRequestDone(_ response : Response)
    {
        let location = response.get(entity: "location")
        print(location ?? "No Location")
        if let myLat = location?["lat"]{
            let myLon = location!["lng"]
            
            self.client.getForecast(latitude: myLat as! Double, longitude: myLon as! Double) { result in
                switch result {
                case .success(let currentForecast, let requestMetadata):
                //  We got the current forecast!
                    print(currentForecast)
                    DispatchQueue.main.async {
                    self.displayLabel.text = currentForecast.currently?.summary
                    }
                    break
                case .failure(let error):
                    //  Uh-oh. We have an error!
                    print(error)
                    self.displayLabel.text = "Error"
                    break
                }
            }
        //print(intent?.slug)
//        displayLabel.text = intent?.slug
        }
        else{
            self.displayLabel.text = "No such location"
        }
    }
    
    func recastRequestError(_ error: Error)
    {
        
    }
}

