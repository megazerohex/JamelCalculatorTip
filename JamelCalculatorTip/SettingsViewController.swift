//
//  SettingsViewController.swift
//  JamelCalculatorTip
//
//  Created by Jamel Peralta Coss on 12/15/15.
//  Copyright © 2015 Jamel Peralta Coss. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipController: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func setDefaultTip(sender: AnyObject) {
        let tipPercentages = [0.15, 0.18, 0.20]
        let tipPercent = tipPercentages[tipController.selectedSegmentIndex]
        
        //This basically saves values between viewControllers
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipPercent, forKey: "tip")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
