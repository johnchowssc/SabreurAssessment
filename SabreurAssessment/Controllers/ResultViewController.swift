//
//  ResultViewController.swift
//  SabreurAssessment
//
//  Created by John Chow on 22/10/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiLabel: String?
    var bmiAdvice: String?
    var adviceColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (bmiLabel!.isEmpty) {
            //Throw Error
        } else {
            BMILabel.text = bmiLabel
            BMIAdvice.text = bmiAdvice
            BMIAdvice.textColor = adviceColor
        }
    }
    
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var BMIAdvice: UILabel!
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
