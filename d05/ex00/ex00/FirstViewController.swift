//
//  FirstViewController.swift
//  ex00
//
//  Created by Kyle ROUTLEDGE on 2018/10/08.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var places:[String] = ["Johannesburg", "Pretoria", "Sandton"]
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell")
        cell?.textLabel?.text = places[indexPath.row]
        return cell!
    }
}
