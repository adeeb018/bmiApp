
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMI() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    mutating func calculateBMI(weight: Float, height: Float) {
        let bmiValue = weight / (height * height)
        print(bmiValue)
        
        if (bmiValue < 18.5) {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.blue)
        } else if (bmiValue < 24.5) {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.red)
        }
    }
}
