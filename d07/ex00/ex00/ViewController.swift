//
//  ViewController.swift
//  ex00
//
//  Created by Kyle ROUTLEDGE on 2018/10/10.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit
import RecastAI
import DarkSkyKit

class ViewController: UIViewController {

    var bot: RecastAIClient? = nil
     //let client = DarkSkyClient(apiKey: "a6bda0c209b0daab9e03fdad6d65caef")
    let forecastClient = DarkSkyKit(apiToken: "a6bda0c209b0daab9e03fdad6d65caef")
    
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
        let text = userInput.text?.trimmingCharacters(in: CharacterSet.init(charactersIn: "\t\n "))
        if text != ""
        {
            makeRequest(request: text!)
        }
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
        
        let c = Configuration(token: "a6bda0c209b0daab9e03fdad6d65caef", units: .si, exclude: .alerts, lang: "en")
        let forecastClient = DarkSkyKit(configuration: c)
        
        if let myLat = location?["lat"]{
            let myLon = location!["lng"]
            
            forecastClient.current(latitude: myLat as! Double, longitude: myLon as! Double) { result in
                switch result {
                case .success(let forecast):
                    // Manage weather data using the Forecast model. Ex:
                    if let current = forecast.currently {
                        let t = current.temperature
                        self.displayLabel.text = current.summary
                    }
                    break
                case .failure(let error):
                    // Manage error case
                    print(error)
                    break
                }
            }
            
//            self.client.getForecast(latitude: myLat as! Double, longitude: myLon as! Double) { result in
//                switch result {
//                case .success(let currentForecast, let requestMetadata):
//                //  We got the current forecast!
//                    print(currentForecast)
//                    DispatchQueue.main.async {
//                    self.displayLabel.text = currentForecast.currently?.summary
//                    }
//                    break
//                case .failure(let error):
//                    //  Uh-oh. We have an error!
//                    print(error)
//                    self.displayLabel.text = "Error"
//                    break
//                }
//            }
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

