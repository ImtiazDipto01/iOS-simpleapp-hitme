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
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100)) // arc4random_uniform method used for generate random value
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
    }
    
    func updateLabel(){
        targetLabel.text = "\(targetValue)"
    }
    
    @IBAction func showAlert(){
        
        let difference : Int = abs(currentValue - targetValue)
        let points : Int = 100 - difference
        
        let message = "The Value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)" +
        "\n Your score \(points) points"
        
        
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider : UISlider){
        print("The Value of slider is now : \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    
    

}

