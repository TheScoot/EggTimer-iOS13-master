//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes : [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var secondsPassed : Int = 0
    var totalTime : Int = 0
    
    var timer : Timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func eggTimeButtonPressed(_ sender: UIButton) {
    
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        totalTime = eggTimes[sender.currentTitle!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        print(eggTimes[sender.currentTitle!]!)
    }
    
    @objc func updateTimer(){
        
        
        if secondsPassed < totalTime {
            secondsPassed = secondsPassed + 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            titleLabel.text = "Done!"
        }
        
    }
}
