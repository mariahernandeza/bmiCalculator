//
//  ViewController.swift
//  bmiCalculator
//
//  Created by Maria Hernandez on 2/19/17.
//  Copyright © 2017 mariahernandez. All rights reserved.
//

import UIKit

//Function to round to 2 decimal places
extension Double{
    func roundTo(places:Int) -> Double{
        let divisor = pow(10.0, Double(places))
        return (self*divisor).rounded()/divisor
    }
}

class ViewController: UIViewController, UITextFieldDelegate{
    
    //MARK: Properties - Labels, TextFields, Images
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var metricUnitsLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiImage: UIImageView!
    
    //MARK: Variables
    var height:Double!
    var weight:Double!
    var bmi: Double?
    var metricSelect:Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Delegate the values to self
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        return true
    }
    //Return the keyboard
    func textView(textView: UITextField, shouldChangeTextInRange range: NSRange, replacementText text:String)-> Bool{
        
        if(text == "\n")
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField)
    {
     //Save the values
        height = Double(heightTextField.text!)
        weight = Double(weightTextField.text!)
        
    }

    //MARK: Actions
    //Calculations in Button
    @IBAction func calculateButton(_ sender: UIButton)
    {
        //Conditions to check if in standard or metric
        if metricSelect == true
        {
            bmi = (weight!/((height)!*(height)!)).roundTo(places: 2)
        }
        else if metricSelect == false
        {
            bmi = (((weight!)/((height)!*(height!)))*703).roundTo(places: 2)
        }
        
        //Conditions under what catagory bmi is under
        if bmi! < 16.00
        {
            bmiLabel.text = "BMI = \(bmi!) Severely Underweight"
            bmiImage.image = UIImage(named:"underweight")
        }
        else if bmi! > 16.00 && bmi! < 16.99
        {
            bmiLabel.text = "BMI = \(bmi!) Moderate Thinness"
            bmiImage.image = UIImage(named:"underweight")
        }
        else if bmi! > 17.00 && bmi! < 18.49
        {
            bmiLabel.text = "BMI = \(bmi!) Mild Thinness"
            bmiImage.image = UIImage(named:"underweight")
        }
        else if bmi! > 18.50 && bmi! < 24.99
        {
            bmiLabel.text = "BMI = \(bmi!) Normal Range"
            bmiImage.image = UIImage(named: "normal")
        }
        else if bmi! > 25.0 && bmi! < 29.99
        {
            bmiLabel.text = "BMI = \(bmi!) Overweight"
            bmiImage.image = UIImage(named: "overweight")
        }
        else if bmi! > 30.00 && bmi! < 34.99
        {
            bmiLabel.text = "BMI = \(bmi!) Obese Class I Moderate"
            bmiImage.image = UIImage(named: "overweight")
        }
        else if bmi! > 35.00 && bmi! < 39.99
        {
            bmiLabel.text = "BMI = \(bmi!) Obese Class II Severe"
            bmiImage.image = UIImage(named: "obese")
        }
        else if bmi! > 39.99
        {
            bmiLabel.text = "BMI = \(bmi!) Obese Class III Very Severe"
            bmiImage.image = UIImage(named: "obeseiii")
        }
    }
    
    //Working the toggle
    @IBAction func metricToggle(_ sender: UISwitch)
    {
        if sender.isOn
        {
            metricSelect = false
            heightTextField.attributedPlaceholder = NSAttributedString(string: "inches")
            weightTextField.attributedPlaceholder = NSAttributedString(string: "pounds")
            
        }
        else
        {
            metricSelect = true
            heightTextField.attributedPlaceholder = NSAttributedString(string: "meters")
            weightTextField.attributedPlaceholder = NSAttributedString(string: "kilograms")
            
        }
    }
    
}
