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
    
    var secondsRemaining : Int = 60
    
    var timer : Timer = Timer()
    
    @IBAction func eggTimeButtonPressed(_ sender: UIButton) {
    
        timer.invalidate()
        
        secondsRemaining = eggTimes[sender.currentTitle!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        print(eggTimes[sender.currentTitle!]!)
    }
    
    @objc func updateTimer(){
        
        
        if secondsRemaining >= 0 {
            print("\(secondsRemaining) seconds remaining")
            secondsRemaining = secondsRemaining - 1
        }
        
    }
}
