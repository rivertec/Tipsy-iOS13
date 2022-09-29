//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Garam kim on 9/28/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    let total : String?
    let percentage : String
    let splitBy : String
    let result : Float?
    
    func checkNumbers(_ userString: String?) -> Float? {
        if let checkedNumber = Float(userString ?? "Error") {
            print("\(checkedNumber) is entered")
            return Float(userString!)
        } else {
            print(userString ?? "Nothing", " is entered")
            return nil
        }
    }
    
    func calcTips(_ info: TipsyBrain) -> TipsyBrain? {
        if checkNumbers(info.total) == nil {
            print("Please enter valid number.")
            return nil
        } else {
            let newResult = Float(info.total!)! * (Float(info.percentage)! + 100.00) / (Float(info.splitBy)! * 100.00)
            return TipsyBrain(total: info.total, percentage: info.percentage, splitBy: info.splitBy, result: newResult)
        }
    }
}
