//
//  SecondVC.swift
//  Opdracht5
//
//  Created by student on 21/11/18.
//  Copyright © 2018 gebruiker. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var scores: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            let line = (String) key + " - " + (String) value
            
        }
    }
}
