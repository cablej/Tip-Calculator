//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Jack Cable on 6/30/15.
//  Copyright © 2015 Jack Cable. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalTextField: UITextField!
    
    @IBOutlet var percentStepper: UISegmentedControl!
    
    @IBOutlet var tipLabel: UILabel!
    
    @IBOutlet var peopleLabel: UILabel!
    
    var numPeople = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func totalTextFieldEdited(sender: UITextField) {
        if(sender.text == "" || sender.text!.characters.first != "$") {
            sender.text = NSString(format: "$%@", sender.text!) as String
        }
        refreshTip()
    }
    
    func getStepperPercent() ->Double {
        switch percentStepper.selectedSegmentIndex {
        case 0:
            return 0.1;
            
        case 1:
            return 0.15;
            
        case 2:
            return 0.2;
            
        case 3:
            return 0.25;
        default:
            print("yeah, yeah, error")
            return 0.15;
        }
    }
    
    func refreshTip() {
        if let bill = Double(String(dropFirst(totalTextField.text!.characters))) {
            let tip = bill * getStepperPercent();
            tipLabel.text = NSString(format: "$%.2f / $%.2f", tip / Double(numPeople), (bill + tip) / Double(numPeople)) as String
        }
    }
    
    @IBAction func percentStepperChanged(sender: UISegmentedControl) {
        refreshTip()
    }
    
    @IBAction func minusButtonTapped(sender: AnyObject) {
        if(numPeople > 1) {
            numPeople--;
            peopleLabel.text = "x\(numPeople)"
            refreshTip()
        }
    }
    
    @IBAction func plusButtonTapped(sender: AnyObject) {
        numPeople++;
        peopleLabel.text = "x\(numPeople)"
        refreshTip()
    }
}

