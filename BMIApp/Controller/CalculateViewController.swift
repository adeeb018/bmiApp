//
//  ViewController.swift
//  BMIApp
//
//  Created by Adeeb K on 09/12/24.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    @IBOutlet weak var heightSliderValue: UISlider!
    @IBOutlet weak var weightSliderValue: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func heightSliderButton(_ sender: UISlider) {
        let height = String(format:"%.2f", sender.value)
        heightLabel.text = height + "m"
    }
    
    @IBAction func weightSliderButton(_ sender: UISlider) {
        let weight = String(format:"%.0f", sender.value)
        weightLabel.text = weight + "Kg"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButton(_ sender: Any) {
        let height = heightSliderValue.value
        let weight = weightSliderValue.value
        
        calculatorBrain.calculateBMI(weight: weight, height: height)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController // Get the new view controller using segue.destination.
            destinationVC.bmiValue = calculatorBrain.getBMI()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            // Pass the selected object to the new view controller.
        }
    }
    
}

