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
    var woordArray: [String]
    var image: Int
    
    init()  {
        self.woord = ""
        self.mawWrongAttemps = 0
        self.woordArray = ["-","-","-","-","-","-"]
        self.image = -1
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
        return mawWrongAttemps
    }
    
    /*extension String {
        func indices (of occurrence: String) -> [Int] {
            var indices = [Int]()
            var position = startIndex
            while let range = range(of: occurrence, range: position..<endIndex) {
                let i = distance(from: startIndex, to: range.lowerBound)
                indices.append(i)
                let offset = occurence.distance(from: occurrence.startIndex, to: occurrence.endIndex)-1
                guard let after = index(range.lowerBound, offsetBy: offset, limitedBy: endIndex) else {
                break
                    
            }
                position = index(after: after)
            }
            return indices
        }
    }*/
    
    func speel(letter:String) -> (correct: Bool, numberOfWrongAttempts:
        Int, woordArray: [String], image:String){
            var correct = false
            
            if woord.contains(letter) {
                correct = true
                
                var range: Range<String.Index> = woord.range(of: letter)!
               
                var w = woordArray
                var index = 0
                
                for char in woord.characters{
                    if(char == Character (letter)) {
                        w[index] = letter
                    }
                    
                    index += 1
                }
                
                woordArray = w
                
            }
            else {
                self.mawWrongAttemps = self.mawWrongAttemps + 1
                self.image = self.image + 1
            }
            
            var img = ""
            
            if (self.image > 0) {
                img = "galgje" + String(self.image) + ".png"
            }
            
            
            return(correct, mawWrongAttemps, woordArray, img)
            
    }
}
