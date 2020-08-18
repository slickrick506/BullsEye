//
//  bullsEyeBrain.swift
//  BullsEye
//
//  Created by Richard Haley on 8/16/20.
//  Copyright © 2020 Ricky Haley. All rights reserved.
//

import Foundation

extension Collection {
    // Returns the element at the specified index if its within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

struct BullBrain {
    
    enum AlertTitle: String {
        case winner = "PERFECT!!!"
        case soClose = "So Close!"
        case notQuite = "Not Quite"
        case loser = "Wow, You Suck"
    }
    
    var targetValue = 0
    var difference = 0
    var score = 0
    var points = 0
    var finalScore = 0
    var actionTitle = "Next Round"
    
    mutating func setTargetValue(sliderMin: Int, sliderMax: Int) -> Int {
        targetValue = Int.random(in: Int(sliderMin)...Int(sliderMax))
        return targetValue
    }
    
    mutating func calculateAttempt(sliderCurrentValue: Int, sliderMax: Int) -> Int {
        
        difference = abs(targetValue - sliderCurrentValue)
        points = sliderMax - (Int(difference)*3)
        
        if difference == 0 {
            points += 100
        } else if difference < 6 {
            points += 25
        }
        score += points
        return points
    }
    
    func getAlertTitle(difference: Int) -> AlertTitle {
        let alertTitle: AlertTitle
        
        if difference == 0 {
            alertTitle = .winner
        } else if difference < 6 {
            alertTitle = .soClose
        }
        else if difference < 50 {
            alertTitle = .notQuite
        } else {
            alertTitle = .loser
        }
        return alertTitle
    }
    
    mutating func setActionTitle(round: Int) -> String {
        let nextLevelTitle = "NEXT LEVEL"
        let nextRoundTitle = "Next Round"
        
        if round % 2 == 0 {
            actionTitle = nextLevelTitle
        } else {
            actionTitle = nextRoundTitle
        }
        return actionTitle
        
    }
    

    
}

