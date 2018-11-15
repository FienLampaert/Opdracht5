//
//  DSDelegatePV.swift
//  Opdracht5
//
//  Created by student on 8/11/18.
//  Copyright © 2018 gebruiker. All rights reserved.
//

import Foundation
import UIKit

class DSDelegatePV: NSObject, UIPickerViewDelegate, UIPickerViewDataSource  {
    let alfabet = ["-", "a","b","c", "d", "e", "f", "g", "h", "i", "j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    var allePV: [String] = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alfabet.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return alfabet[row]
    }
    
    func rowForString(letter: String) -> Int {
        var index: Int = 0
        var i: Int = 0
        
        for l in alfabet {
            if( letter == l ){
                i = index
            }
            index += 1
        }
        
        return i
    }
}
