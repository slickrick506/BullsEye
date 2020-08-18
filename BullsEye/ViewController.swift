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
    @IBOutlet weak var levelLabel: UILabel!
    
    var currentValue: Int = 0
    var randomNumber = 0
    var score = 0
    var round = 0
    var targetValue = 0
    var finalScore = 0
    var bullBrain = BullBrain()
    var level = 1
    var highScores: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maxValueLabel.text = String(Int(slider.maximumValue))
        startNewRound()
        slider.setThumbImage(#imageLiteral(resourceName: "bullThumb"), for: .normal)
        slider.setThumbImage(#imageLiteral(resourceName: "bullThumb"), for: .highlighted)
    }
    
    @IBAction func hitMePressed() {
        let points = bullBrain.calculateAttempt(sliderCurrentValue: currentValue, sliderMax: Int(slider.maximumValue))
        score += points
        
        let message = "You selected \(currentValue) \nTarget was \(targetValue) \nYou scored \(points) points"
        let alertTitle = bullBrain.getAlertTitle(difference: bullBrain.difference).rawValue
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Next Round", style: .default, handler: { _ in
            self.levelSelect()
            self.startNewRound()
            
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(slider.value)
        print(currentValue)
    }
    
    @IBAction func startOverPressed() {
        slider.maximumValue = 100
        score = 0
        round = 0
        level = 1
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
        levelLabel.text = "Level: \(level)"
    }
    
    @IBAction func infoPressed() {
        let alert = UIAlertController(title: "Made By Slickrick", message: "in Bozeman, MT", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func gameOver() {
            highScores.append(score)
            highScores.sort(by: >)
        if highScores.count > 3 {
            print(highScores)
            highScores = highScores.dropLast(1)
            print(highScores)
        }
        print(highScores)
            
            let alert = UIAlertController(title: "Game Over", message: "Final Score: \(score)", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: {self.startOverPressed()})
        
    }
    
    func levelSelect() {
        if round == 2 && score < 180 {
            gameOver()
        } else if round == 4 && score < 600 {
            gameOver()
        } else if round == 6 && score < 1500 {
            gameOver()
        } else if round == 8 && score < 3000 {
            gameOver()
        } else if round == 10 {
            gameOver()
        }
        
        if round % 2 == 0 {
            level += 1
            slider.maximumValue *= 2
        }
    }
    
    @IBAction func highScoresPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToHighScores", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHighScores" {
            let destinationVC = segue.destination as! HighScoreViewController
            destinationVC.highScores = highScores
        }
    }
}

