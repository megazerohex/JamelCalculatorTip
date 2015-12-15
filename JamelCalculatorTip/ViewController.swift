//
//  ViewController.swift
//  JamelCalculatorTip
//
//  Created by Jamel Peralta Coss on 12/14/15.
//  Copyright © 2015 Jamel Peralta Coss. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate{
    //Variables for StoryBoard
    @IBOutlet weak var initialBillTextView: UITextView!
    @IBOutlet weak var billTextView: UITextView!
    @IBOutlet weak var tipControler: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var barShowView: UIView!
    @IBOutlet weak var moneyLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Disappear
        self.barShowView.alpha = 0.0
        
        //Make use of delacate method
        initialBillTextView.delegate = self
        
    }
    
    //This is a method for managing computes after leaving second screen appears.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let billAmount = Double(billTextView.text!){
            //Gets the value store in the NSuserdefault
            let defaults = NSUserDefaults.standardUserDefaults()
            let tipPercent = defaults.doubleForKey("tip")
            
            //Calculations
            let tip = billAmount * tipPercent
            let total = billAmount + tip
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            
        }
        
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        [initialBillTextView .becomeFirstResponder()]
        
    }
    
    //Delagate Method, when you write something in TextView, this method happens
    func textViewDidChange(textView: UITextView) {
        if let billAmount = Double(initialBillTextView.text!){
            
            //Make the keyboard go to the billTextView
            [billTextView .becomeFirstResponder()]
            billTextView.delegate = self
            billTextView.text = initialBillTextView.text
            initialBillTextView.text = ""
            
            //Animation
            self.initialBillTextView.alpha = 0.0
            self.moneyLabel.alpha = 0.0
            UIView.animateWithDuration(1.0, animations: {self.barShowView.alpha = 1.0})
            
            //Calculation
            let tip = billAmount * self.tipPercent()
            let total = calculationBill(billAmount)
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }
        else if let billAmount = Double(billTextView.text!){
            //Calculation
            let tip = billAmount * self.tipPercent()
            let total = calculationBill(billAmount)
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }
        else{
            //Animation
            UIView.animateWithDuration(1.0, animations: {self.barShowView.alpha = 0.0})
            self.initialBillTextView.alpha = 1.0
            self.moneyLabel.alpha = 1.0
            [initialBillTextView .becomeFirstResponder()]
            
        }
    }
    
    //Each Time you change the Tip segmentation
    @IBAction func changeTip(sender: AnyObject) {
        let billAmount = Double(billTextView.text!)
        let tip = billAmount! * self.tipPercent()
        let total = calculationBill(billAmount!)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    //Calculation formulas
    func calculationBill(billAmount: Double) -> Double{
        let tip = billAmount * self.tipPercent()
        return billAmount + tip
    }
    func tipPercent() -> Double{
        let tipPercentages = [0.15, 0.18, 0.20]
        return tipPercentages[tipControler.selectedSegmentIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

