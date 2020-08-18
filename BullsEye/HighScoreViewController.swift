//
//  HighScoreViewController.swift
//  BullsEye
//
//  Created by Richard Haley on 8/17/20.
//  Copyright © 2020 Ricky Haley. All rights reserved.
//

import UIKit

class HighScoreViewController: UIViewController {
    
    var highScores: [Int] = []
    
    @IBOutlet weak var firstPlace: UILabel!
    @IBOutlet weak var secondPlace: UILabel!
    @IBOutlet weak var thirdPlace: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if highScores.count > 0 {
            firstPlace.text = String("1st: \(highScores[0])")
        }
        if highScores.count > 1 {
            secondPlace.text = String("2nd: \(highScores[1])")
        }
        if highScores.count > 2 {
            thirdPlace.text = String("3rd: \(highScores[2])")
        }
        
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
