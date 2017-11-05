//
//  ViewController.swift
//  BullsEye
//
//  Created by Matthew McKee on 02/11/2017.
//  Copyright © 2017 Matthew McKee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue  = 0
    var currentRound = 0
    var currentScore = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var currentRoundLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSlider()
        startNewRound()
    }
    
    func styleSlider(){
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = lroundf(slider.value)
        currentRound += 1
        updateLabels()
    }
    
    @IBAction func startOver(){
        currentRound = 0
        currentScore = 0
        startNewRound()
    }
    
    func updateLabels(){
        targetValueLabel.text = String(targetValue)
        currentRoundLabel.text = String(currentRound)
        currentScoreLabel.text = String(currentScore)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("the value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert(){
        
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference < 5{
            title = "You Almost had it"
            if difference == 1{
                points += 100
            }
        }else{
            title = "Not even close..."
        }
        
        let message = "You scored  \(points) points"
        currentScore += points
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
        action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
