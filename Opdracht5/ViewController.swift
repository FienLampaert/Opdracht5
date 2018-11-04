//
//  ViewController.swift
//  Opdracht5
//
//  Created by gebruiker on 04/11/2018.
//  Copyright © 2018 gebruiker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let galgje = Galgje()
    
    @IBOutlet var lblGalgje: UILabel!
    @IBOutlet weak var vpEerste: UIPickerView!
    @IBOutlet weak var vpTweede: UIPickerView!
    @IBOutlet weak var vpDerde: UIPickerView!
    @IBOutlet weak var vpVierde: UIPickerView!
    @IBOutlet weak var vpVijfde: UIPickerView!
    @IBOutlet weak var vpZesde: UIPickerView!
    @IBOutlet weak var vpSpel: UIPickerView!
    @IBOutlet var imgStart: UIImageView!
    @IBOutlet var imgGalgje: UIImageView!
    
    @IBAction func btnSpeel(_ sender: Any) {
        
        let spel = galgje.speel(letter: "a")
        let imgName = spel.image
        let image = UIImage(named: imgName)
        let imageView = UIImageView(image: image)
        
        if (spel.numberOfWrongAttempts > 0) {
            imgStart.addSubview(imageView)
        }
        
        
        if(self.galgje.getWoord() == ""){
            let alert2 = UIAlertController(title: "Foutieve invoer", message: "Er werd geen correct woord ingevoerd", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert2, animated: true)
        }
        else {
            let spel = galgje.speel(letter: "a")
            let imgName = spel.image
            let image = UIImage(named: imgName)
            let imageView = UIImageView(image: image)
            
            if (spel.numberOfWrongAttempts > 0) {
                imgStart.addSubview(imageView)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let klikG = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
        imgStart.isUserInteractionEnabled = true
        imgStart.addGestureRecognizer(klikG)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let tapedImage = tapGestureRecognizer.view as! UIImageView
        //lblGalgje.backgroundColor = UIColor.red
        
        let alert = UIAlertController(title: "GALGJE", message: "Geef woord van 6 letter...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Annuleer", style: .default, handler:nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            let woord = alert.textFields?.first?.text
            
            if woord?.trimmingCharacters(in: .whitespaces) != ""{
                
                
                if(self.galgje.startSpel(woord: woord!) == false){
                    let alert2 = UIAlertController(title: "Foutieve invoer", message: "Het ingevoerde woord bevat geen zes letters", preferredStyle: .alert)
                    alert2.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
                    self.present(alert2, animated: true)
                }
                
            }
            else {
                let alert3 = UIAlertController(title: "Foutieve invoer", message: "Er werd geen woord ingevoerd", preferredStyle: .alert)
                alert3.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
                self.present(alert3, animated: true)
            }
            
            
        }))
        
        alert.addTextField(configurationHandler: {
            textField in
            textField.placeholder = "Geef een woord in."
        })
        
        self.present(alert, animated: true)
    }

}

