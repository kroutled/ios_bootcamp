//
//  ViewController.swift
//  ex00
//
//  Created by Kyle ROUTLEDGE on 2018/10/04.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data = Data.notesOfDeath
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deathNoteCell")
        cell?.textLabel?.text = data[indexPath.row].0
        cell?.detailTextLabel?.text = data[indexPath.row].1
        
        return cell!
    }
    
    @IBAction func unWindSegue(segue: UIStoryboardSegue){}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
}

