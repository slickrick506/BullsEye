//
//  ViewController.swift
//  BullsEye
//
//  Created by Richard Haley on 8/14/20.
//  Copyright © 2020 Ricky Haley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var maxValueLabel: UILabel!
    
    var currentValue: Int = 0
    var randomNumber = 0
    var score = 0
    var round = 0
    var targetValue = 0
    var finalScore = 0
    var bullBrain = BullsEyeModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        maxValueLabel.text = String(Int(slider.maximumValue))
        startNewRound()
    }

    @IBAction func hitMePressed() {
        
        let points = bullBrain.calculateAttempt(sliderCurrentValue: currentValue, sliderMax: Int(slider.maximumValue))
        
        score += points
        
        let message = "You selected \(currentValue) \nTarget was \(targetValue) \nYou scored \(points) points"
        let alertTitle = bullBrain.getAlertTitle(difference: bullBrain.difference).rawValue
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Next Round", style: .default, handler: { _ in
            self.startNewRound()
            self.gameOver()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(slider.value)
        print(currentValue)
    }
    
    @IBAction func startOverPressed() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = bullBrain.setTargetValue(sliderMin: Int(slider.minimumValue), sliderMax: Int(slider.maximumValue))
        slider.value = slider.maximumValue / 2
        currentValue = lroundf(slider.value)
        round += 1
        updateLabel()
    }
    
    func updateLabel() {
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        targetLabel.text = String(targetValue)
        maxValueLabel.text = String(Int(slider.maximumValue))
    }
    
    @IBAction func infoPressed() {
        
        let alert = UIAlertController(title: "Made By Slickrick", message: "in Bozeman, MT", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func gameOver() {
        if round > 3 {
            
            finalScore = score
            
            let alert = UIAlertController(title: "Game Over", message: "Final Score: \(finalScore)", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: {self.startOverPressed()})
        }
    }
    
}

