//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Garam kim on 9/28/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit


class ResultViewController: MainViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var resultData : TipsyBrain?
    
    override func viewDidLoad() {
        
        totalLabel.text = "$" + String(format: "%.2f", resultData?.result ?? "Error")
        
        descriptionLabel.text = "Split between \(resultData?.splitBy ?? "2") people, with \(resultData?.percentage ?? "10")% tip."
        
    }
    
    
    @IBAction func recalcBtnPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
}
