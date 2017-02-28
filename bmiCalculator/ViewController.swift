//
//  ViewController.swift
//  bmiCalculator
//
//  Created by Maria Hernandez on 2/19/17.
//  Copyright © 2017 mariahernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    

    //MARK: Properties
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
        // Do any additional setup after loading the view, typically from a nib.
        
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
        //heightTextField.delegate = height as! UITextFieldDelegate?
        //weightTextField.delegate = weight as! UITextFieldDelegate?
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        return true
    }
    
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
    @IBAction func calculateButton(_ sender: UIButton)
    {
        if metricSelect == false
        {
            bmi = (weight!/((height)!*(height)!)).rounded()
        }
        else
        {
            bmi = (((weight!)/((height)!*(height!)))*703).rounded()
        }
        
        
        bmiLabel.text = "BMI = \(bmi)"
        
        if bmi! < 16.00
        {
            bmiLabel.text = "BMI = \(bmi) Severely Underweight"
        }
        else if bmi! > 16.00 && bmi! < 16.99
        {
            bmiLabel.text = "BMI = \(bmi) Moderate Thinness"
        }
        else if bmi! > 17.00 && bmi! < 18.49
        {
            bmiLabel.text = "BMI = \(bmi) Mild Thinness"
        }
        else if bmi! > 18.50 && bmi! < 24.99
        {
            bmiLabel.text = "BMI = \(bmi) Normal Range"
        }
        else if bmi! > 25.0 && bmi! < 29.99
        {
            bmiLabel.text = "BMI = \(bmi) Overweight"
        }
        else if bmi! > 30.00 && bmi! < 34.99
        {
            bmiLabel.text = "BMI = \(bmi) Obese Class I Moderate"
        }
        else if bmi! > 35.00 && bmi! < 39.99
        {
            bmiLabel.text = "BMI = \(bmi) Obese Class II Severe"
        }
        else if bmi! > 39.99
        {
            bmiLabel.text = "BMI = \(bmi) Obese Class III Very Severe"
        }
    }
    
    @IBAction func metricToggle(_ sender: UISwitch)
    {
        if sender.isOn
        {
            metricSelect = true
            
            heightTextField.attributedPlaceholder = NSAttributedString(string: "meters")
            weightTextField.attributedPlaceholder = NSAttributedString(string: "kilograms")
        }
        else
        {
            metricSelect = false
            bmiLabel.text = "bmi not in metric"
            heightTextField.attributedPlaceholder = NSAttributedString(string: "inches")
            weightTextField.attributedPlaceholder = NSAttributedString(string: "pounds")
            
        }
    }
    
}
