//
//  ViewController.swift
//  Opdracht5
//
//  Created by gebruiker on 04/11/2018.
//  Copyright © 2018 gebruiker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var lblGalgje: UILabel!
    @IBOutlet weak var vpEerste: UIPickerView!
    @IBOutlet weak var vpTweede: UIPickerView!
    @IBOutlet weak var vpDerde: UIPickerView!
    @IBOutlet weak var vpVierde: UIPickerView!
    @IBOutlet weak var vpVijfde: UIPickerView!
    @IBOutlet weak var vpZesde: UIPickerView!
    @IBOutlet weak var vpSpel: UIPickerView!

    @IBOutlet var imgStart: UIImageView!
    @IBOutlet var btnSpel: UIButton!
    
    var alfabet: [String] = [String]()
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alfabet.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return alfabet[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         alfabet = ["-", "a","b","c", "d", "e", "f", "g", "h", "i", "j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        
        vpEerste.delegate = self
        vpEerste.dataSource = self
        
        vpTweede.delegate = self
        vpTweede.dataSource = self
        
        vpDerde.delegate = self
        vpDerde.dataSource = self
        
        vpVierde.delegate = self
        vpVierde.dataSource = self
        
        vpVijfde.delegate = self
        vpVijfde.dataSource = self
        
        vpZesde.delegate = self
        vpZesde.dataSource = self
        
        vpSpel.delegate = self
        vpSpel.dataSource = self
        
        let klikG = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
        imgStart.isUserInteractionEnabled = true
        imgStart.addGestureRecognizer(klikG)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let tapedImage = tapGestureRecognizer.view as! UIImageView
        lblGalgje.backgroundColor = UIColor.red
    }

}

