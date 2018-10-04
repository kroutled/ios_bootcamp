//
//  NoteViewController.swift
//  ex00
//
//  Created by Kyle ROUTLEDGE on 2018/10/04.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    @IBOutlet weak var descriptionField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateField.minimumDate = Date()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    @IBAction func doneButton(_ sender: UIBarButtonItem) {
//        let dateformatter = DateFormatter()
//        dateformatter.dateFormat = "yyyy/MM/dd"
//
//        print(nameField.text!, descriptionField.text!, dateformatter.string(from: dateField.date))
//
//        Data.notesOfDeath.append((nameField.text!, descriptionField.text!, dateformatter.string(from: dateField.date)))
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy/MM/dd"
        if nameField.text == ""
        {
            print("Ima gay")
        }
        else
        {
            if descriptionField.text == ""
            {
                descriptionField.text = "Heart Attack"
            }
            print(nameField.text!, descriptionField.text!, dateformatter.string(from: dateField.date))
        
            let destVC = segue.destination as! ViewController
            destVC.data.append((nameField.text!, descriptionField.text!, dateformatter.string(from: dateField.date)))
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
