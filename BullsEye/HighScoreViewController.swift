//
//  HighScoreViewController.swift
//  BullsEye
//
//  Created by Richard Haley on 8/17/20.
//  Copyright © 2020 Ricky Haley. All rights reserved.
//

import UIKit
import Foundation

class HighScoreViewController: UIViewController {
    
    @IBOutlet weak var firstPlace: UILabel!
    @IBOutlet weak var secondPlace: UILabel!
    @IBOutlet weak var thirdPlace: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPlace.text = "1st: \(getHiScoreMsg(index: 0))"
        secondPlace.text = "2nd: \(getHiScoreMsg(index: 1))"
        thirdPlace.text = "3rd: \(getHiScoreMsg(index: 2))"
    }
    
    func getHiScoreMsg(index: Int) -> String {
        let highScores = UserDefaults.standard.array(forKey: "HighScoresSaved") as? [Int] ?? []
        
        if let dillon = highScores[safe: index] {
            return String(dillon)
        } else {
            return "PLAY MORE"
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
