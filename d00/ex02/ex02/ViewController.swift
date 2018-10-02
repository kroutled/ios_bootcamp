//
//  ViewController.swift
//  ex02
//
//  Created by Kyle ROUTLEDGE on 2018/10/01.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var screenNumber:Double = 0;
    var firstNumber:Double = 0;
    var mathOp = false;
    var dmsa = 0;
    var neg1 = false;
    
    @IBOutlet weak var numbersLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if (mathOp == true)
        {
            numbersLabel.text = String(sender.tag - 1)
            screenNumber = Double(numbersLabel.text!)!
            mathOp = false
        }
        else
        {
            numbersLabel.text = numbersLabel.text! + String(sender.tag - 1)
            if (Double(numbersLabel.text!)! < -2147483648 || Double(numbersLabel.text!)! > 2147483647)
            {
                print("overflow")
                screenNumber = 0
                firstNumber = 0
                numbersLabel.text = ""
            }
            else
            {
                screenNumber = Double(numbersLabel.text!)!
            }
        }
        print(String(sender.tag - 1))
    }
    
    @IBAction func operations(_ sender: UIButton)
    {
        if sender.tag == 12 && numbersLabel.text != ""
        {
            if (neg1 == false)
            {
                neg1 = true
                numbersLabel.text = "-" + numbersLabel.text!
                screenNumber = -screenNumber
            }
            else
            {
                neg1 = false
                numbersLabel.text!.remove(at: numbersLabel.text!.startIndex)
                screenNumber = -screenNumber
            }
        }
        if numbersLabel.text != "" && sender.tag != 11 && sender.tag != 17 && sender.tag != 12
        {
            if (numbersLabel.text != "" && sender.tag == 13 || sender.tag == 14 || sender.tag == 15 || sender.tag == 16)
            {
                if numbersLabel.text == "/" || numbersLabel.text == "*" || numbersLabel.text == "+" || numbersLabel.text == "-"
                {
                    print("error")
                }
                else
                {
                    firstNumber = Double(numbersLabel.text!)!
                    if mathOp == false
                    {
                        if sender.tag == 13 //devide
                        {
                            numbersLabel.text = "/"
                        }
                        else if sender.tag == 14 //multiply
                        {
                            numbersLabel.text = "*"
                        }
                        else if sender.tag == 15 //addition
                        {
                            numbersLabel.text = "+"
                        }
                        else if sender.tag == 16 //subtraction
                        {
                            numbersLabel.text = "-"
                        }
                }
                mathOp = true
                dmsa = sender.tag
                neg1 = false
                print(numbersLabel.text)
            }
            }
        }
        else if sender.tag == 17
        {
            print("=")
            if screenNumber == 0
            {
                print("cant divide by 0")
                screenNumber = 0
                firstNumber = 0
                numbersLabel.text = ""
                
            }
            else
            {
                if dmsa == 13
                {
                    numbersLabel.text = String(firstNumber / screenNumber)
                }
                else if dmsa == 14
                {
                    numbersLabel.text = String(firstNumber * screenNumber)
                }
                else if dmsa == 15
                {
                    numbersLabel.text = String(firstNumber + screenNumber)
                }
                else if dmsa == 16
                {
                    numbersLabel.text = String(firstNumber - screenNumber)
                }
            }
        }
        else if sender.tag == 11
        {
            print("AC")
            screenNumber = 0
            firstNumber = 0
            numbersLabel.text = ""
            if (neg1 == true)
            {
                neg1 = false
            }
        }
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

