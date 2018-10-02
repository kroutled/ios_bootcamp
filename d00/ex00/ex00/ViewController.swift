//
//  ViewController.swift
//  ex00
//
//  Created by Kyle ROUTLEDGE on 2018/10/01.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var helloLabel: UILabel!
    @IBAction func clickButton(_ sender: UIButton) {
        print("Hello World!")
        helloLabel.text = "Hello World!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

