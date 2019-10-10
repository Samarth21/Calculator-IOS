//
//  ViewController.swift
//  Calculator
//
//  Created by Samarth Patel on 2019-05-15.
//  Copyright © 2019 Samarth Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Class properties
    var calculations = Calculations()
    var readyToAcceptNewNumber = true

    //Mark:- Outlets
    @IBOutlet weak var numberDisplayLabel: UILabel!
    
    @IBOutlet var allButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //iterate over all buttons
    }

    //Mark:- Event Listners
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        //TODO: Do something with the key just pressed
        print("button pressed")
        print(sender.currentTitle!)
        
       var currentVal = numberDisplayLabel.text!
        
          print ("current value is " + currentVal)
        
        switch (sender.currentTitle!) {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            if readyToAcceptNewNumber {
                currentVal = sender.currentTitle!
                readyToAcceptNewNumber = false
            } else {
                currentVal = currentVal + sender.currentTitle!
            }
        case "C":
            //TODO: clear text
            currentVal = "0"
            calculations.reset()
        case ".":
            //TODO: process .
            if (!currentVal.contains(".")) {
                currentVal = currentVal + "."
            }
        case "+", "-", "*", "/":
            if (calculations.firstNumber != nil) {
                calculations.secondNumber = Double(currentVal)
                if let result = calculations.calculateResult() {
                    currentVal = String(format:"%g", result)
                    calculations.firstNumber = result
                    calculations.secondNumber = nil
                } else {
                    currentVal = "Error"
                }
                readyToAcceptNewNumber = true
            } else {
                calculations.operation = sender.currentTitle!
                calculations.firstNumber = Double(currentVal)
                readyToAcceptNewNumber = true
            }
        case "=":
            calculations.secondNumber = Double(currentVal)
            if let result = calculations.calculateResult() {
                currentVal = String(format:"%g", result)
            } else {
                currentVal = "Error"
            }
            readyToAcceptNewNumber = true
        default:
            break
        }
        
        numberDisplayLabel.text = currentVal
        
    }
    
}

