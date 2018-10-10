//
//  ViewController.swift
//  ex00
//
//  Created by Kyle ROUTLEDGE on 2018/10/10.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit
import RecastAI

class ViewController: UIViewController {

    var bot: RecastAIClient? = nil
    
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
        self.bot?.textRequest(request, successHandler: {(Response) in self.recastRequestDone(Response)}, failureHandle: {(Response) in self.recastRequestError(Response as! Response)})
    }
    
    func recastRequestDone(_ response : Response)
    {
        let intent = response.intent()
        //print(intent?.slug)
        displayLabel.text = intent?.slug
    }
    
    func recastRequestError(_ response : Response)
    {
        
    }

}

