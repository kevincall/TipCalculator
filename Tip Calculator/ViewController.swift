//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Kevin M Call on 1/15/17.
//  Copyright © 2017 Kevin M Call. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var costPPLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages = [0.16, 0.18, 0.20, 0.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func changePeople(_ sender: Any) {
        calcTips(Any.self);
    }
    @IBAction func changeTip(_ sender: Any) {
        calcTips(Any.self);
    }

    @IBAction func customTip(_ sender: Any) {
        tipControl.selectedSegmentIndex = 3;
        let subtotal = Double(billAmountField.text!) ?? 0
        let tip = Double(tipAmountField.text!) ?? 0
        let tipPercent = tip/subtotal
        tipPercentages[3] = tipPercent
        tipControl.selectedSegmentIndex = 3
        let text = String(format: "%.2f",tipPercent*100)+" %"
        tipControl.setTitle(text, forSegmentAt: 3)
        calcTips(Any.self);
    }
   
    
    @IBAction func calcTips(_ sender: Any) {
        let subtotal = Double(billAmountField.text!) ?? 0
        let tip = subtotal * tipPercentages[tipControl.selectedSegmentIndex]
        let total = subtotal + tip;
        
        let people = Int(peopleField.text!) ?? 1
        let cpp = total/Double(people);
        
        tipAmountField.text = String(format: "%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
        costPPLabel.text = String(format: "$%.2f",cpp)
    }
}

