//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var secondsRemaining = 1
        var eggCountdown = 0
        let eggTimes = ["Soft": 5, "Medium": 7,"Hard": 12]
    var timer = Timer()
    
    @IBOutlet weak var eggTimerStatus: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        progressBar.progress = 0
    }
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0
        
        let hardness = sender.currentTitle!
                let result = eggTimes[hardness]!
                eggCountdown = result * secondsRemaining
                
               timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                        if self.eggCountdown > 0 {
                            self.eggTimerStatus.text = "Preparing \(hardness.lowercased()) eggs..."
                            self.eggCountdown -= 1
                            self.progressBar.progress = 1.0 - (Float(self.eggCountdown)/Float(result*self.secondsRemaining))
                            print ("\(Float(self.eggCountdown)/Float(result*self.secondsRemaining)) seconds.")
                            
                        } else {
                            self.eggTimerStatus.text = "Done!"
//                            self.progressBar.progress = 1.0
                            Timer.invalidate()
                        }
                   
                    }
    }
    
}
