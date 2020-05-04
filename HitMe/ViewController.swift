//
//  ViewController.swift
//  HitMe
//
//  Created by Imtiaz Uddin Ahmed on 26/3/20.
//  Copyright © 2020 Imtiaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue : Int  = 0
    var targetValue : Int = 0
    var score = 0
    var roundNumber = 0
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNameGame()
        setSlideBackground()
        
    }
    
    private func setSlideBackground(){
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlight = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlight, for: .highlighted)
        
        let insert = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftImageResizeable  = trackLeftImage.resizableImage(withCapInsets: insert)
        slider.setMinimumTrackImage(trackLeftImageResizeable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightImageResizeable  = trackRightImage.resizableImage(withCapInsets: insert)
        slider.setMaximumTrackImage(trackRightImageResizeable, for: .normal)
    }
    
    @IBAction func startNameGame(){
        score = 0
        roundNumber = 0
        startNewRound()
    }
    
    private func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100)) // arc4random_uniform method used for generate random value
        currentValue = 50
        slider.value = Float(currentValue)
        roundNumber += 1
        updateLabel()
    }
    
    private func updateLabel(){
        targetLabel.text = "\(targetValue)"
        scoreLabel.text  = String(score)
        roundLabel.text = String(roundNumber)
    }
    
    @IBAction func showAlert(){
        
        let difference : Int = abs(currentValue - targetValue)
        var points : Int = 100 - difference
        
        let title : String
        if(difference == 0){
            title = "Perfect!"
            points += 100
        }else if(difference < 5){
            title = "You almost had it!"
        }else if(difference < 10){
            title = "Pretty good!"
        }else{
            title = "Not even close..."
        }
        score += points
        
        
        let message = "The Value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)" +
        "\n Your score \(points) points"
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider : UISlider){
        print("The Value of slider is now : \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    

}

