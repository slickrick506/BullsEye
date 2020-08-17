//
//  bullsEyeBrain.swift
//  BullsEye
//
//  Created by Richard Haley on 8/16/20.
//  Copyright © 2020 Ricky Haley. All rights reserved.
//

import Foundation

struct BullsEyeModel {
    
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
    var round = 0
    
    mutating func setTargetValue(sliderMin: Int, sliderMax: Int) -> Int {
        targetValue = Int.random(in: Int(sliderMin)...Int(sliderMax))
        return targetValue
    }
    
    mutating func calculateAttempt(sliderCurrentValue: Int, sliderMax: Int) -> Int {
        print(round)
        
        difference = abs(targetValue - sliderCurrentValue)
        points = sliderMax - Int(difference)

        if difference == 0 {
           points += 100
        } else if difference < 3 {
            points += 25
        }
        
        print("difference of \(difference)")
        score += points
        print("score is \(score)")
        round += 1
        print("round \(round)")
        
        return points
        
        
    }
    
    func getAlertTitle(difference: Int) -> AlertTitle {
        let alertTitle: AlertTitle
        
        if difference == 0 {
            alertTitle = .winner
        } else if difference < 3 {
            alertTitle = .soClose
        }
        else if difference < 50 {
            alertTitle = .notQuite
        } else {
            alertTitle = .loser
        }
        return alertTitle
    }
    
    mutating func calculateScore() {
        
        score += points
    }
    
}
// hello testing a branch
