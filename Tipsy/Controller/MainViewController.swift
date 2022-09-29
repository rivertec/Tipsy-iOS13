//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var tenBtn: UIButton!
    @IBOutlet weak var twentyBtn: UIButton!
    
    @IBOutlet weak var pplAmount: UILabel!

    @IBOutlet weak var billTotal: UITextField!
    
    
    var btnSelected = "10"
    var tipsyBrain : TipsyBrain? = TipsyBrain(total: nil, percentage: "10", splitBy: "2", result: nil)
    var calcResult: TipsyBrain? = nil
    
    @IBAction func billEntered(_ sender: UITextField) {

        
    }

    
    @IBAction func percentSelected(_ sender: UIButton) {
        
        let tipBtns : [UIButton] = [zeroBtn, tenBtn, twentyBtn]
        
        for button in tipBtns {
            if button == sender {
                button.isSelected = true
                btnSelected = (button.accessibilityLabel)!
            } else {
                button.isSelected = false
            }
        }
        if tipsyBrain?.checkNumbers(billTotal.text) == nil {
            print("Please enter number only")
        } else {
            billTotal.endEditing(true)
            print(billTotal.text!, " will be calculated")
        }
    }
    
    
    @IBAction func splitAdjusted(_ sender: UIStepper) {
        billTotal.endEditing(true)
        pplAmount.text = String(format: "%.0f", sender.value)
    }
    
    
    @IBAction func calcBtnPressed(_ sender: UIButton) {
        tipsyBrain = TipsyBrain(total: billTotal.text, percentage: btnSelected, splitBy: pplAmount.text!, result: nil)
        
        calcResult = tipsyBrain?.calcTips(tipsyBrain!)
        
        if calcResult != nil {
            self.performSegue(withIdentifier: "goToResult", sender: self)
        } else {
            print("Nothing Happened")
        }
        print(String(format: "%.2f", calcResult?.result ?? "Error"))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.resultData = calcResult
        }
    }
}

