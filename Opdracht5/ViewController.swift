//
//  ViewController.swift
//  Opdracht5
//
//  Created by gebruiker on 04/11/2018.
//  Copyright © 2018 gebruiker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var galgje: Galgje = Galgje()
    
    
    @IBOutlet var lblGalgje: UILabel!
    @IBOutlet weak var vpEerste: UIPickerView!
    @IBOutlet weak var vpSpel: UIPickerView!
    @IBOutlet var imgStart: UIImageView!
    @IBOutlet weak var imgGalgje: UIImageView!
    @IBOutlet var tvWoorden: UITextView!
    
    @IBAction func btnSpeel(_ sender: Any) {
        
        if(self.galgje.getWoord() == ""){
            let alert2 = UIAlertController(title: "Foutieve invoer", message: "Er werd geen correct woord ingevoerd", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert2, animated: true)
        }
        else {
            let letterIndex = vpSpel.selectedRow(inComponent: 0)
            let ds = vpSpel.dataSource as! DSDelegatePVOneChar
            let letter = ds.getLetter(index: letterIndex)
            
            let spel = galgje.speel(letter: letter)
            let correct = spel.correct
            let imgName = spel.image
            let wrong = spel.numberOfWrongAttempts
            //let arrayW = spel.woordArray
            let arrayW = ["1","2","1","2","1","2"]
            
            if (correct == true) {
                for i in 0...5 {
                    tvWoorden.text += arrayW[i]
                    tvWoorden.backgroundColor = UIColor.red
                    lblGalgje.backgroundColor = UIColor.red
                    //self.lblGalgje.text += arrayW[i]
                }
                tvWoorden.text += "\n"
                
            }
            else {
                if (wrong < 12) {
                    if (!(imgName == "")) {
                        let yourImg: UIImage = UIImage(named: imgName)!
                        let imgGalgje = UIImageView(image: yourImg)
                        
                        
                        if (spel.numberOfWrongAttempts > 0) {
                            self.view.addSubview(imgGalgje)
                        }
                    }
                }
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
                
                self.galgje = Galgje()
                
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

