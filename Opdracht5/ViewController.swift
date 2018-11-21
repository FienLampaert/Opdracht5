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
        
        let woord = galgje.getWoord()
        
        if(woord == ""){
            let alert2 = UIAlertController(title: "Foutieve invoer", message: "Er werd geen correct woord ingevoerd", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert2, animated: true)
        }
        else {
            let letterIndex = vpSpel.selectedRow(inComponent: 0)
            let ds = vpSpel.dataSource as! DSDelegatePV
            let letter = ds.getLetter(index: letterIndex)
            let spel = galgje.speel(letter: letter)
            let correct = spel.correct
            var imgName = ""
            
            if( !(spel.image == "")){
                imgName = spel.image
            }
            
            let wrong = spel.numberOfWrongAttempts
            let arrayW = spel.woordArray
            
            tvWoorden.text += "\n"
            
            var i = 0
            var gevonden = true
           
            if (correct == true) {
                
                    for char in woord.characters{
                        
                        tvWoorden.text += arrayW[i]
                        
                        if(char == Character (letter)) {
                            //let dss = vpEerste.dataSource as! DSDelegatePV
                            let row = ds.rowForString(letter: letter)
                            vpEerste.selectRow(row, inComponent: i, animated: true)
                            
                        }
                        i += 1
                    }
                
                for i in arrayW {
                    if (i == "-") {
                        gevonden = false
                    }
                }
                
                if (gevonden == true) {
                    let alert2 = UIAlertController(title: "Gewonnen", message: "Je hebt het woord gevonden. Geef je naam op.", preferredStyle: .alert)
                    alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                        action in
                        let naam = alert2.textFields?.first?.text
                        let score = 0
                        
                        if(naam?.trimmingCharacters(in: .whitespaces) != "") {
                            UserDefaults.standard.set(score, forKey: naam! )
                        }
                        else {
                            let alert3 = UIAlertController(title: "Geen naam", message: "Jammer, je gaf geen naam op. Je zal niet in de topscore opgenomen worden", preferredStyle: .alert)
                            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
   
                    self.present(alert3, animated: true)
                    
                        }
                        
                    }))
                }
                
            }
            else {
                imgGalgje.isHidden = false
                if (wrong < 12) {
                    if (!(imgName == "")) {
                        let yourImg: UIImage = UIImage(named: imgName)!
                        let imgG = UIImageView(image: yourImg)
                        
                        
                        if (wrong > 0) {
                            self.imgGalgje.addSubview(imgG)
                        }
                    }
                }
                else {
                    let alert2 = UIAlertController(title: "Verloren", message: "Jammer, je hebt het woord niet gevonden. Het woord was " + woord + ".", preferredStyle: .alert)
                    alert2.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
                    self.present(alert2, animated: true)
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
        
        self.vpEerste.tag = 6
        self.vpSpel.tag = 1
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let tapedImage = tapGestureRecognizer.view as! UIImageView
        //lblGalgje.backgroundColor = UIColor.red
        
        let alert = UIAlertController(title: "GALGJE", message: "Geef een woord van 6 letter...", preferredStyle: .alert)
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
                
                //let dss = self.vpEerste.dataSource as! DSDelegatePV
                
                for i in 0...5 {
                    self.vpEerste.selectRow(0, inComponent: i, animated: true)
                }
                
                self.vpSpel.selectRow(0, inComponent: 0, animated: true)
                
                self.tvWoorden.text = "- - - - - -"
                
                //let yourImg: UIImage = UIImage(named: "")!
                //self.imgGalgje = UIImageView(image: "")
                //self.view.addSubview(self.imgGalgje)
                //self.imgGalgje.image = nil
                self.imgGalgje.isHidden = true
                
                //let yourImg: UIImage = UIImage(named: imgName)!
                //let imgG = UIImageView(image: nil)
                //self.imgGalgje.addSubview(imgG)
                
                
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

