//
//  ViewController.swift
//  SabreurAssessment
//
//  Created by John Chow on 22/10/21.
//

import UIKit

class CalculateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.BMITitle.alpha = 0.0 //Make title invisible initially.
        displayHeight(height: heightSlider.value) //Set initial height label value
        displayWeight(weight: weightSlider.value) //Set initial weight label value
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5){
            self.BMITitle.alpha = 1.0
        }
    }

    @IBOutlet weak var BMITitle: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    var calculator = Calculator() //Initialise Calculator struct instance.
    
    //var bmiLabel: String = "" //Initialise with empty String

    
    
    //Initialise height and weight labels to slider values.
    
    
    func displayHeight(height: Float) {
        let heightString = String(format: "%.02f" , height)
        heightLabel.text = "\(heightString)m"
    }
    
    func displayWeight(weight: Float) {
        let weightString = String(format: "%.01f" , weight)
        weightLabel.text = "\(weightString)kg"
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        displayHeight(height: sender.value)
    }
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        displayWeight(weight: sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        //let bmi = weight / (pow(height,2))
        //bmiLabel = String(format: "%.02f" , bmi)
        
        calculator.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    //Check that the segue.identifier is as expected for the result view controller, then set destinationVC as that segue destination and downcast it as the expected custom view controlle class so that we can access the latter's variables.
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController
            if (!calculator.getBMIValue().isEmpty) {
                //print(bmiLabel)
                //print(calculator.getBMIValue())
                destinationVC.bmiLabel = calculator.getBMIValue()
                destinationVC.bmiAdvice = calculator.getAdvice()
                destinationVC.adviceColor = calculator.getColor()
            } else {
                //Throw Error
            }
        } else {
            //Throw Error
        }
        
        
    }
    
}

