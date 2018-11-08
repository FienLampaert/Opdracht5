//
//  Galgje.swift
//  Opdracht5
//
//  Created by student on 8/11/18.
//  Copyright © 2018 gebruiker. All rights reserved.
//

import Foundation

class Galgje {
    var woord: String
    var mawWrongAttemps: Int
    
    init()  {
        self.woord = ""
        self.mawWrongAttemps = 0
    }
    
    func getWoord() -> String{
        return self.woord
    }
    
    func controle6Letters(woord: String) -> Bool {
        var correct = false
        
        if (woord.count == 6){
            correct = true
            
            for c in woord {
                if(!(c >= "a" && c <= "z")){
                    correct = false
                }
            }
            
        }
        
        return correct
    }
    
    func startSpel(woord: String) -> Bool{
        let controle = controle6Letters(woord: woord)
        var correct = false
        
        if(controle == true){
            self.woord = woord
            correct = true
        }
        
        return correct
    }
    
    func getMawWrongAttemps() -> Int{
        return 0
    }
    
    func speel(letter:String) -> (correct: Bool, numberOfWrongAttempts:
        Int, woordArray: [String], image:String){
            
    }
}
